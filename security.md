# Security in Azure

This document outlines my contributions to security within Azure environments, focusing on governance, compliance, and enhanced protection strategies.

---

## Azure Policy

### Overview
Managed Azure policies to enforce compliance and governance across cloud resources.

### Key Contributions
- Developed and implemented Azure Policies to ensure compliance across multiple subscriptions and resources.
- Created custom policies tailored to specific organizational needs.
- Monitored compliance and automated the remediation of non-compliant resources.

### Impact
- Improved governance and security posture across the organization.
- Ensured that cloud resources adhered to regulatory and security standards.

---

### Policies Developed

#### 1. Audit Storage Accounts with External IP Addresses Attached
- **Purpose**: To identify storage accounts that have external IP addresses attached, ensuring they are not publicly accessible unless required.
- **Impact**: Enhanced visibility and compliance regarding the security posture of storage accounts.
- **Code**: [Audit Storage Accounts Policy](https://github.com/BradleyLawson/azure-policy/blob/main/Audit-Storage-External.tf)

---

#### 2. Audit Key Vaults with External IP Addresses Attached
- **Purpose**: To monitor Key Vaults for external IP address access, ensuring sensitive data remains secure.
- **Impact**: Improved security practices for accessing sensitive information stored in Key Vaults.

---

#### 3. Audit Azure Database of PostgreSQL Flexible Servers with External IP Addresses Attached
- **Purpose**: To check for external IP addresses on Azure Database for PostgreSQL Flexible Servers, reducing exposure to potential threats.
- **Impact**: Strengthened security by limiting unnecessary external access to database resources.

---

#### 4. Audit Azure Database for PostgreSQL Resources with External IP Addresses Attached
- **Purpose**: To ensure that Azure Database for PostgreSQL resources are not publicly accessible without justification.
- **Impact**: Enhanced compliance and security measures for database management.

---

#### 5. Deny Public Access to Managed Disks
- **Purpose**: To prevent public access to managed disks, ensuring data confidentiality and integrity.
- **Impact**: Significantly reduced the risk of data exposure through public access.

---

#### 6. Deny Public Access to Snapshots
- **Purpose**: To enforce restrictions on public access to snapshots, maintaining data privacy.
- **Impact**: Protected sensitive information stored in snapshots from unauthorized access.

---

#### 7. Deny NSG Rules Outside of Approved List
- **Purpose**: To ensure that only pre-approved Network Security Group (NSG) rules are applied, maintaining a consistent security posture.
- **Impact**: Improved network security by limiting the creation of non-compliant rules.

---

#### 8. Deny Service Bus Resources with Less Than Minimum TLS Version
- **Purpose**: To ensure that all Service Bus resources utilize a minimum TLS version for secure communication.
- **Impact**: Strengthened security for data in transit by enforcing modern encryption standards.

---

#### 9. Deploy Private DNS Zone for Cognitive Services and OpenAI
- **Purpose**: To automate the deployment of a private DNS zone for secure communication with Cognitive Services and OpenAI resources.
- **Impact**: Enhanced security through isolation of DNS resolution for sensitive services.

---

#### 10. Deny Event Grid Resources with Less Than Minimum TLS Version
- **Purpose**: To enforce the use of minimum TLS version on Event Grid resources to ensure secure event transmission.
- **Impact**: Improved security measures for event-driven architectures.

---

## Conclusion

Through these Azure Policies, I have contributed to creating a robust security framework within Azure, ensuring compliance and safeguarding the organization's assets. Each policy plays a crucial role in maintaining security standards and protecting sensitive resources.

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
Managed security exemptions to meet specific compliance requirements without compromising security.

### Key Contributions
- Reviewed and assessed requests for security exemptions, ensuring alignment with compliance needs.
- Applied appropriate exceptions while maintaining the overall security posture of the organization.

### Impact
- Successfully navigated compliance flexibility while upholding stringent security measures.
- Reduced the risk of non-compliance while allowing for necessary operational adjustments.

---

## Onboard VMs to Microsoft Defender for Endpoint

### Overview
Integrated virtual machines with Microsoft Defender for Endpoint to enhance security and threat protection.

### Key Contributions
- Configured and deployed endpoint security policies across all virtual machines.
- Monitored and addressed potential vulnerabilities through the Defender threat protection suite.

### Impact
- Strengthened the organization’s defense against cyber threats.
- Improved visibility and response capabilities regarding potential security incidents.

---

## Conclusion

Through these efforts, I have contributed to creating a robust security framework within Azure, ensuring compliance and safeguarding the organization's assets. Each section outlines specific contributions and their impact on overall security and compliance.

---

## Get in Touch

- **Email**: [your-email@example.com](mailto:your-email@example.com)
- **LinkedIn**: [linkedin.com/in/yourprofile](https://linkedin.com/in/yourprofile)



## **View More of My work**
[![Go to Automation](https://img.shields.io/badge/Automation-blue?style=for-the-badge)](./automation.md)

