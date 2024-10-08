# Automation

This document outlines my contributions to automation I was an integral part in creating for a key Business process, focusing on governance, compliance, and enhanced protection strategies.

---

## Background
We had defined in our policy repos IP addresses that are allowed and maintained within our Corporate Network. However, if an IP address needed to be removed or added to the repo, the lead time could be quite long as it had to go through a process of a story being written, assigned, and validated. There was a need to streamline this process, so that if the Firewall team made a change, the repository could be automatically updated.

## Solution
There were many ways we could have handled this. Logic Apps, Function Apps, and Runbooks were all possibilities. We decided to implement a Function app written in Powershell that integrated our internal Firewall API, the Github API, and a TEAMS webhook for communication. In the end, the app would call the internal Firewall API if there was a change. The changes were evaluated against a stored file within Azure. If and only if there was a change to that file would the API to Github be called. This would trigger the creation of a new feature branch, update the files with the IP addresses, merge the new branch into a development branch, then call a pull request to our release branch, and then send a message to TEAMs for the appropriate approvals to be merged to Release.

## Code

[Check out the code here](./automation.ps1) 


## Conclusion

Through this effort I was able to help streamline what was once a tedious, time-consuming and wasteful process, freeing up engineers to work on other projects.

---

## Get in Touch

- **Email**: [bradleydlawson@outlook.com](mailto:bradleydlawson@outlook.com)
- **LinkedIn**: [linkedin.com/in/brad-lawson](https://linkedin.com/in/brad-lawson)
- **Portfolio**: [bradleylawson.github.io/Resume/](https://bradleylawson.github.io/Resume/)

---


## **View More of My Work**

[![Go to Collaboration](https://img.shields.io/badge/Collaboration-green?style=for-the-badge)](./collaboration.md) &nbsp;
[![Go to Documentation](https://img.shields.io/badge/Documentation-orange?style=for-the-badge)](./documentation.md) &nbsp;
[![Go to Operations](https://img.shields.io/badge/Operations-purple?style=for-the-badge)](./operations.md) &nbsp;
[![Go to Research](https://img.shields.io/badge/Research-red?style=for-the-badge)](./research.md) &nbsp;
[![Go to Security](https://img.shields.io/badge/Security-black?style=for-the-badge)](./security.md) &nbsp;
[![Go to Tagging](https://img.shields.io/badge/Tagging-yellow?style=for-the-badge)](./tagging.md) &nbsp;
[![Go to Troubleshooting](https://img.shields.io/badge/Troubleshooting-pink?style=for-the-badge)](./troubleshooting.md)