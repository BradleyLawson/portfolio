# Security in Azure

This document outlines my contributions to security within Azure environments, focusing on governance, compliance, and enhanced protection strategies.

---

## Azure Policy

### Overview
Managed Azure policies to enforce compliance and governance across cloud resources. Through these Azure Policies, I have contributed to creating a more secure posture within Azure, ensuring compliance and safeguarding the organization's assets. Each policy plays a crucial role in maintaining security standards and protecting sensitive resources.

### Key Contributions
- Developed and implemented Azure Policies to ensure compliance across multiple management groups, subscriptions and resources.
- Created custom policies tailored to specific organizational needs.
- Monitored compliance and automated the remediation of non-compliant resources.

### Impact
- Improved governance and security posture across the organization.
- Ensured that cloud resources adhered to regulatory and security standards.
- Worked with a team to increase security compliance over 80%. 

---

### Policies Developed

#### 1. Audit Storage Accounts with External IP Addresses Attached
- **Purpose**: To identify storage accounts that have external IP addresses attached, ensuring they are not publicly accessible unless required.
- **Impact**: Enhanced visibility and compliance regarding the security posture of storage accounts.
- **Code**: [Audit Storage Policy](https://github.com/BradleyLawson/azure-policy/blob/main/Audit-Storage-External.tf)

---

#### 2. Audit Key Vaults with External IP Addresses Attached
- **Purpose**: To monitor Key Vaults for external IP address access, ensuring sensitive data remains secure.
- **Impact**: Improved security practices for accessing sensitive information stored in Key Vaults.
- **Code**: [Audit KeyVault Policy](https://github.com/BradleyLawson/azure-policy/blob/main/Audit-KeyVault-External.tf)

---

#### 3. Audit Azure Database of PostgreSQL Flexible Servers with External IP Addresses Attached
- **Purpose**: To check for external IP addresses on Azure Database for PostgreSQL Flexible Servers, reducing exposure to potential threats.
- **Impact**: Strengthened security by limiting unnecessary external access to database resources.
- **Code**: [Audit PostgreSql Flexible Servers Policy](https://github.com/BradleyLawson/azure-policy/blob/main/Audit-PostgresqlFlexible-External.tf)

---

#### 4. Audit Azure Database for PostgreSQL Resources with External IP Addresses Attached
- **Purpose**: To ensure that Azure Database for PostgreSQL resources are not publicly accessible without justification.
- **Impact**: Enhanced compliance and security measures for database management.
- **Code**: [Audit PostgreSql Policy](https://github.com/BradleyLawson/azure-policy/blob/main/Audit-Postgresql-External.tf)

---

#### 5. Deny Public Access to Managed Disks
- **Purpose**: To prevent public access to managed disks, ensuring data confidentiality and integrity.
- **Impact**: Significantly reduced the risk of data exposure through public access.
- **Code**: [Deny Managed Disks Public Access Policy](https://github.com/BradleyLawson/azure-policy/blob/main/Deny-External-ManagedDisks.tf)

---

#### 6. Deny Public Access to Snapshots
- **Purpose**: To enforce restrictions on public access to snapshots, maintaining data privacy.
- **Impact**: Protected sensitive information stored in snapshots from unauthorized access.
- **Code**: [Deny Snapshots Public Access Policy](https://github.com/BradleyLawson/azure-policy/blob/main/Deny-External-Snapshots.tf)

---

#### 7. Deny NSG Rules Outside of Approved List
- **Purpose**: To ensure that only pre-approved Network Security Group (NSG) rules are applied, maintaining a consistent security posture.
- **Impact**: Improved network security by limiting the creation of non-compliant rules.
- **Code**: [Deny Unapproved NSG Access Policy](https://github.com/BradleyLawson/azure-policy/blob/main/Deny-Unapproved-NSGs.tf)

---

#### 8. Deny Service Bus Resources with Less Than Minimum TLS Version
- **Purpose**: To ensure that all Service Bus resources utilize a minimum TLS version for secure communication.
- **Impact**: Strengthened security for data in transit by enforcing modern encryption standards.
- **Code**: [Deny Service Bus Minimum TLS Policy](https://github.com/BradleyLawson/azure-policy/blob/main/Deny-ServiceBus-TLS.tf)

---

#### 9. Deploy Private DNS Zone for Cognitive Services and OpenAI
- **Purpose**: To automate the deployment of a private DNS zone for secure communication with Cognitive Services and OpenAI resources.
- **Impact**: Enhanced security through isolation of DNS resolution for sensitive services.
- **Code**: [Deploy Private DNS Zoone for Coginite Services Policy](https://github.com/BradleyLawson/azure-policy/blob/main/Deploy-PrivateDNS-OpenAi.tf)

---

#### 10. Deny Event Grid Resources with Less Than Minimum TLS Version
- **Purpose**: To enforce the use of minimum TLS version on Event Grid resources to ensure secure event transmission.
- **Impact**: Improved security measures for event-driven architectures.
- **Code**: [Deny Event Grid Minimum TLS Policy](https://github.com/BradleyLawson/azure-policy/blob/main/Deny-EventGrid-TLS.tf)

---

## Security Compliance and Remediation

### Overview
Addressed compliance issues and enforced security standards through proactive remediation.

### Key Contributions
- Identified non-compliant resources and applied upgrades to bring them in line with security standards.
- Updated Azure Policies and performed infrastructure changes to resolve compliance issues.

### Impact
- Maintained continuous compliance with evolving industry standards and organizational policies.
- Enhanced the security posture of cloud resources, reducing potential vulnerabilities.

---

## Security Exception Handling

### Overview
Managed security exemptions to meet specific compliance requirements without compromising security for integral business solutions.

### Key Contributions
- Reviewed and assessed requests for security exemptions, ensuring alignment with compliance needs.
- Applied appropriate exceptions while maintaining the overall security posture of the organization.
- Ensured business continuity on the resources essential for functionality while still maintaining secure practices.

### Impact
- Successfully navigated compliance flexibility while upholding stringent security measures.
- Reduced the risk of non-compliance while allowing for necessary operational adjustments.

---

## Onboard VMs to Microsoft Defender for Endpoint

### Overview
Integrated virtual machines with Microsoft Defender for Endpoint to enhance security and threat protection.

### Key Contributions
- Researched VMs not currently empowerd with Microsoft Defender for Endpoint 
- Worked with Product owners to assist in Onboarding the Defender solution.

### Impact
- Strengthened the organization’s defense against cyber threats.
- Improved visibility and response capabilities regarding potential security incidents.

---

## Conclusion

Through these efforts, I have contributed to creating a robust security framework within Azure, ensuring compliance and safeguarding the organization's assets. Each section outlines specific contributions and their impact on overall security and compliance.

---

## Get in Touch

- **Email**: [bradleydlawson@outlook.com](mailto:bradleydlawson@outlook.com)
- **LinkedIn**: [linkedin.com/in/brad-lawson](https://linkedin.com/in/brad-lawson)



## **View More of My Work**

[![Go to Automation](https://img.shields.io/badge/Automation-blue?style=for-the-badge)](./automation.md) &nbsp;
[![Go to Collaboration](https://img.shields.io/badge/Collaboration-green?style=for-the-badge)](./collaboration.md) &nbsp;
[![Go to Operations](https://img.shields.io/badge/Operations-purple?style=for-the-badge)](./operations.md) &nbsp;
[![Go to Research](https://img.shields.io/badge/Research-red?style=for-the-badge)](./research.md) &nbsp;
[![Go to Security](https://img.shields.io/badge/Security-black?style=for-the-badge)](./security.md) &nbsp;
[![Go to Tagging](https://img.shields.io/badge/Tagging-yellow?style=for-the-badge)](./tagging.md) &nbsp;
[![Go to Troubleshooting](https://img.shields.io/badge/Troubleshooting-pink?style=for-the-badge)](./troubleshooting.md)