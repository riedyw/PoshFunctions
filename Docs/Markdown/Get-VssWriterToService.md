---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-VssWriterToService

## SYNOPSIS

Displays a list of 'vssadmin list writers' and corresponds them to a service

## SYNTAX

### __AllParameterSets

```
Get-VssWriterToService [<CommonParameters>]
```

## DESCRIPTION

Displays a list of 'vssadmin list writers' and corresponds them to a service

When diagnosing vss writer issues if the State of one of the vss writes is not equal to '[1] Stable' the next troubleshooting tip is to restart the corresponding service.

This function returns that list


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-VssWriterToService
```

VssWriter                         ServiceName         ServiceDisplayName
-------------                     -----------         ------------------
ASR Writer                        VSS                 Volume Shadow Copy
BITS Writer                       BITS                Background Intelligent Transfer Service
Certificate Authority             CertSvc             Active Directory Certificate Services
COM+ REGDB Writer                 VSS                 Volume Shadow Copy
DFS Replication service writer    DFSR                DFS Replication
DHCP Jet Writer                   DHCPServer          DHCP Server
FRS Writer                        NtFrs               File Replication
FSRM writer                       srmsvc              File Server Resource Manager
IIS Config Writer                 AppHostSvc          Application Host Helper Service
IIS Metabase Writer               IISADMIN            IIS Admin Service
Microsoft Exchange Replica Writer MSExchangeRepl      Microsoft Exchange Replication Service
Microsoft Exchange Writer         MSExchangeIS        Microsoft Exchange Information Store
Microsoft Hyper-V VSS Writer      vmms                Hyper-V Virtual Machine Management
MSMQ Writer (MSMQ)                MSMQ                Message Queuing
MSSearch Service Writer           WSearch             Windows Search
NPS VSS Writer                    EventSystem         COM+ Event System
NTDS                              NTDS                Active Directory Domain Services
OSearch VSS Writer                OSearch             Office SharePoint Server Search
OSearch14 VSS Writer              OSearch14           SharePoint Server Search 14
Registry Writer                   VSS                 Volume Shadow Copy
Shadow Copy Optimization Writer   VSS                 Volume Shadow Copy
SMS Writer                        SMS_SITE_VSS_WRITER SMS_SITE_VSS_WRITER
SPSearch VSS Writer               SPSearch            Windows SharePoint Services Search
SPSearch4 VSS Writer              SPSearch4           SharePoint Foundation Search V4
SqlServerWriter                   SQLWriter           SQL Server VSS Writer
System Writer                     CryptSvc            Cryptographic Services
TermServLicensing                 TermServLicensing   Remote Desktop Licensing
VSS Writer                        Service Name        Related Windows Service To Restart
WDS VSS Writer                    WDSServer           Windows Deployment Services Server
WIDWriter                         WIDWriter           Windows Internal Database VSS Writer
WINS Jet Writer                   WINS                Windows Internet Name Service (WINS)
WMI Writer                        Winmgmt             Windows Management Instrumentation





### Example 2: EXAMPLE 2

```
Find the list of unstable vss writers and restart their corresponding service
```

$UnstableVss = Get-VssWriter | Where-Object { $_.State -ne '[1] Stable' }
$VssToService = Get-VssWriterToService

$VssToService  |
    Where-Object { $_.VssWriter -in $UnstableVss.Writer } |
    ForEach-Object { Restart-Service -Name $_.ServiceName -Force }





### Example 3: EXAMPLE 3

```
(Get-VssWriterToService)[0..2]
```

VssWriter             ServiceName ServiceDisplayName
---------             ----------- ------------------
ASR Writer            VSS         Volume Shadow Copy
BITS Writer           BITS        Background Intelligent Transfer Service
Certificate Authority CertSvc     Active Directory Certificate Services






## PARAMETERS


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### System.Management.Automation.PSObject



## NOTES

List of VSS Writers coming from multiple places

https://support.carbonite.com/articles/Server-Windows-List-of-VSS-Writers-and-Services
https://support.unitrends.com/hc/en-us/articles/360013245618-VSS-Writer-Failed-How-to-Restart-and-Re-Register-VSS-Writers>
https://web.archive.org/web/20220118095704/https://support.unitrends.com/hc/en-us/articles/360013245618-VSS-Writer-Failed-How-to-Restart-and-Re-Register-VSS-Writers
https://www.veeam.com/kb2041


## RELATED LINKS

Fill Related Links Here

