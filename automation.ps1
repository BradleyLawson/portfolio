using namespace System.Net
# CICD Subscription
# Timer to run once per day
# $InputBlob is file from storage
param($Request, $InputBlob, $TriggerMetadata)
Write-Host "PowerShell Timer trigger function executed at: $($Timer.ScheduleStatus.Last)"
# Define the API URL
$API_URL = $env:FW_API
# Array to store IP addresses from API response
$ipAddresses = @()
# Make the HTTP GET request (Skip Cert Check during testing)
$response = Invoke-RestMethod -Uri $API_URL -Method Get -SkipCertificateCheck
# Loop through API $response and pull out just Internet IP Addresses
foreach ($object in $response) {
    $internetIPAddress = $object.'Internet IP Address'
    $ipAddresses += $internetIPAddress
}
# Ensure $InputBlob is an array by splitting on new lines
$InputBlob = $InputBlob -split "`r`n"
# Compare the two arrays
$ipsToAdd = $ipAddresses | Where-Object { $_ -notin $InputBlob }
$ipsToRemove = $InputBlob | Where-Object { $_ -notin $ipAddresses }
Write-Output "IPs to Add: $ipsToAdd"
Write-Output "IPs to Remove: $ipsToRemove"
# Commit message prefix
$commitMessagePrefix = "NIN-2686"
# If different override the file in Storage
if ($ipsToAdd.Count -gt 0 -or $ipsToRemove.Count -gt 0) {
    $InputBlob = $ipAddresses
    $ipAddressesString = $InputBlob -join "`r`n"
    Push-OutputBinding -Name outputBlob -Value $ipAddressesString
    ########################## GITHUB ######################################
    $githubToken   = $env:GITHUB_TOKEN
    $owner         = $env:REPO_OWNER
    $repo          = $env:REPO
    $releaseBranch = "release"
    $newBranch     = "feature/<branchname>/Automation-$(Get-Date -Format 'yyyyMMddHHmmss')"
    $devBranch     = "dev"
    $filePath      = "<filepath>"
    $query         = "?ref="
    $headers = @{
        "Content-Type" = "application/json"
        "User-Agent" = "Powershell"
        "Authorization" = "Bearer $githubToken"
        "Accept" = "application/vnd.github.v3+json"
    }
    # Function to create a new branch from the release branch
    function NewBranch {
        param (
            [string]$baseBranch,
            [string]$newBranch
        )
        $uri = "https://api.github.com/repos/$owner/$repo/git/refs/heads/$baseBranch"
        $baseBranchResponse = Invoke-RestMethod -Uri $uri -SkipCertificateCheck -Method Get -Headers $headers
        if ($baseBranchResponse) {
            $baseSha = $baseBranchResponse.object.sha
            # Create the new branch from the release branch
            $createBranchUri = "https://api.github.com/repos/$owner/$repo/git/refs"
            $createBranchBody = @{
                ref = "refs/heads/$newBranch"
                sha = $baseSha
            } | ConvertTo-Json
            $createBranchResponse = Invoke-RestMethod -Uri $createBranchUri -SkipCertificateCheck -Method Post -Headers $headers -Body $createBranchBody
            if ($createBranchResponse) {
                Write-Output "Successfully created new branch '$newBranch' from '$baseBranch'."
                return $true
            } else {
                Write-Output "Failed to create new branch."
                return $false
            }
        } else {
            Write-Output "Failed to get the latest commit SHA from the release branch."
            return $false
        }
    }
    # Create a new branch from the release branch
    if (-not (NewBranch -baseBranch $releaseBranch -newBranch $newBranch)) {
        Write-Output "Aborting process due to failure in creating new branch."
        return
    }
    # Fetch the content of the new branch
    $newBranchUri = "https://api.github.com/repos/$owner/$repo/contents/$filePath$query$newBranch"
    $newBranchResponse = Invoke-RestMethod -Uri $newBranchUri -SkipCertificateCheck -Method Get -Headers $headers
    if ($newBranchResponse) {
        Write-Output "Successfully fetched the file content from the new branch."
       
        # Decode the Base64 content
        $fileContent = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($newBranchResponse.content))
       
        # Use a regular expression to extract the external_ips array
        $pattern = '(?s)external_ips\s*=\s*\[(.*?)\]'
        if ($fileContent -match $pattern) {
            $external_ips_string = $matches[1] -replace '\s', ''
            $external_ips = $external_ips_string -split ','
            Write-Output "Current external_ips in the file: $external_ips"
            # Check for differences
            $differencesFound = $false
            foreach ($ip in $external_ips) {
                if ($ip -notin $InputBlob) {
                    $differencesFound = $true
                    break
                }
            }
            foreach ($ip in $InputBlob) {
                if ($ip -notin $external_ips) {
                    $differencesFound = $true
                    break
                }
            }
            if ($differencesFound) {
                $external_ips = $InputBlob
                Write-Output "Updated External IPs to be saved: $external_ips"
                Write-Output "External IPs:"
                Write-Output $external_ips
                # Prepare the updated content
                $quotedIPs = $external_ips | ForEach-Object { "`"$_`"" }
                Write-Output "Quoted IPs:"
                Write-Output $quotedIPs
                $updatedContent = $fileContent -replace $pattern, "external_ips = [$($quotedIPs -join ', ')]"
                Write-Output "Updated Content:"
                Write-Output $updatedContent
                # Prepare the PUT request payload
                $updatePayload = @{
                    message = "$commitMessagePrefix Update external_ips to match latest data"
                    content = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($updatedContent))
                    sha = $newBranchResponse.sha
                    branch = $newBranch
                } | ConvertTo-Json
                # Update the file in the new branch
                $updateFileUri = "https://api.github.com/repos/$owner/$repo/contents/$filePath"
                $updateFileResponse = Invoke-RestMethod -Uri $updateFileUri -SkipCertificateCheck -Method Put -Headers $headers -Body $updatePayload
                if ($updateFileResponse) {
                    Write-Output "Successfully updated the file content in the new branch."
                } else {
                    Write-Output "Failed to update the file content."
                    return
                }
                # Create and merge pull request to dev branch
                $createPrUri = "https://api.github.com/repos/$owner/$repo/pulls"
                $createPrBody = @{
                    title = "$commitMessagePrefix Update external_ips"
                    head = $newBranch
                    base = $devBranch
                    body = "This PR updates the external_ips variable with the latest IP addresses."
                } | ConvertTo-Json
                $createPrResponse = Invoke-RestMethod -Uri $createPrUri -SkipCertificateCheck -Method Post -Headers $headers -Body $createPrBody
                if ($createPrResponse) {
                    Write-Output "Successfully created a pull request to dev branch: $($createPrResponse.html_url)"
                    # Merge the pull request to dev branch
                    $mergePrUri = "https://api.github.com/repos/$owner/$repo/pulls/$($createPrResponse.number)/merge"
                    $mergePrBody = @{
                        commit_title = "$commitMessagePrefix Merge pull request #$($createPrResponse.number)"
                        merge_method = "merge"
                    } | ConvertTo-Json
                    $mergePrResponse = Invoke-RestMethod -Uri $mergePrUri -SkipCertificateCheck -Method Put -Headers $headers -Body $mergePrBody
                    if ($mergePrResponse) {
                        Write-Output "Successfully merged the pull request to dev branch."
                        # Fetch the content of the <filepath> file in the dev branch to confirm update
                        $devBranchUri = "https://api.github.com/repos/$owner/$repo/contents/$filePath$query$devBranch"
                        $devBranchResponse = Invoke-RestMethod -Uri $devBranchUri -SkipCertificateCheck -Method Get -Headers $headers
                        if ($devBranchResponse) {
                            # Decode the Base64 content
                            $devFileContent = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($devBranchResponse.content))
                            Write-Output "Updated content in dev branch:"
                            Write-Output $devFileContent
                        } else {
                            Write-Output "Failed to fetch the file content from the dev branch."
                        }
                    } else {
                        Write-Output "Failed to merge the pull request to dev branch."
                    }
                } else {
                    Write-Output "Failed to create a pull request to dev branch."
                    return
                }
                # Create a pull request from the new branch to release branch
                $createPrBody = @{
                    title = "$commitMessagePrefix Update external_ips"
                    head = $newBranch
                    base = $releaseBranch
                    body = "This PR updates the external_ips variable with the latest IP addresses."
                } | ConvertTo-Json
                $createPrResponse = Invoke-RestMethod -Uri $createPrUri -SkipCertificateCheck -Method Post -Headers $headers -Body $createPrBody
                if ($createPrResponse) {
                    Write-Output "Successfully created a pull request to release branch: $($createPrResponse.html_url)"
                    $JSONBody = [PSCustomObject][Ordered]@{
                    "@type"      = "MessageCard"
                    "@context"   = "http://schema.org/extensions"
                    "summary"    = "Incoming Alert Test Message!"
                    "themeColor" = '0078D7'
                    "title"      = "Pull Request!"
                    "text"       = "Two Cloud Engineering approvals and one SecOps approval requested on the following PR: $($createPrResponse.html_url)"
                }
                $TeamMessageBody = ConvertTo-Json $JSONBody -Depth 100
                $parameters = @{
                    "URI"         = $env:TEAMS_URL
                    "Method"      = 'POST'
                    "Body"        = $TeamMessageBody
                    "ContentType" = 'application/json'
                }
               
                Invoke-RestMethod @parameters | Out-Null
                } else {
                    Write-Output "Failed to create a pull request to release branch."
                    return
                }
            } else {
                Write-Output "No differences found. No updates needed."
            }
        } else {
            Write-Output "Failed to find the external_ips variable in the file content from the new branch."
            return
        }
    } else {
        Write-Output "Failed to fetch the file content from the new branch."
        return
    }
} else {
    Write-Output "No differences found. No updates needed."
}
