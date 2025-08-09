# Active Directory Workshops
This repository contains the PDFs of two introductory workshops about Active Directory: Penetration Testing in Active Directory Environments I (introductory) and Penetration Testing in Active Directory Environments II (intermediate). Both have been developed and expanded over several years. This content has been used in private training sessions for companies, universities and security conferences such as [RootedCON](https://www.rootedcon.com/inicio/). 

Both workshops had a custom CTF to put into practice all the theory covered. You can check the template used here [Ansible AD Lab](https://github.com/MrSquid25/Active-Directory-WorkShops/tree/main/Ansible%20AD%20Lab). This lab is provided **as-is**, without any guarantees or support. For those interested in adding other hands-on lab, check [Ludus](https://github.com/badsectorlabs/ludus) and [GOAD](https://github.com/Orange-Cyberdefense/GOAD).

Feel free to copy, redistribute or use this material. Just remember to mention this repo as a reference!

Made with love by MrSquid, [Luis Vázquez](https://github.com/macgruap) and [Helena Jalain](https://es.linkedin.com/in/helenajalainbravo).

⚠️ **Note:** English version will be updated soon.

## Syllabus -- Penetration Testing in Active Directory Environments I
* Intro to AD
* Objects and items in AD
  * Privileges, Rights & Permissions
  * Privileged Groups
  * Group Policy Objects
  * Access Control Lists
* Intro to PowerShell
* Intro to Kerberos
  * Kerberos in Active Directory
  * Things to know
  * Dissecting Kerberos with WireShark (PCAP included)
* AD Enumeration
* Common misconfigurations in AD
  * Shared Folders
  * AD parameters
  * Password Spraying
  * Duplicated Accounts
  * Overly Privileged Groups
  * Forced Authentication
  * LLMNR/NBT-NS Poisoning
  * Basic Kerberos Abuses
* Native Techniques of Lateral Movement 

## Syllabus -- Penetration Testing in Active Directory Environments II
*  Intro to AD
  * LAPS, ASR, AppLocker, WDAC & SCCM 
* Classic Windows Defender Evasion Techniques
  * C# for pentesters
  * PowerShell (L) .NET
  * AMSI
* AD Enumeration II
  * Manual vs Automatic Enumeration
  * BloodHound
  * Linux Enumeration
* Common misconfigurations in AD II
  * ACLs Abuse
  * Jumping between forests
  * Jumping between domains, subdomains and forest
  * SID History Attack
  * LAPS Abuse
  * Privileged Groups Abuse
  * GPO Abuse 
* Delegation
  * Constained, Unconstrained and Resource-Based Delegation
* Dumping secrets
  * SAM, LSA & LSASS
  * NTDS
  * RDP
  * Scheduled Tasks
  * Services
  * DPAPI
* Lateral Movement
  * Forging Tickets
  * Tools for Lateral Movement
  * Pass The Ticket & Pass The Hash
  * Stealthy Lateral Movement
* Persistence
  * Shadow Credentials
  * Other Techniques  
