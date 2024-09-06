function Get-VssWriterToService {
<#
.SYNOPSIS
    Displays a list of 'vssadmin list writers' and corresponds them to a service
.DESCRIPTION
    Displays a list of 'vssadmin list writers' and corresponds them to a service

    When diagnosing vss writer issues if the State of one of the vss writes is not equal to '[1] Stable' the next troubleshooting tip is to restart the corresponding service.

    This function returns that list
.EXAMPLE
    Get-VssWriterToService

    VssWriterName                     ServiceName         ServiceDisplayName
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
.EXAMPLE

#>

    [CmdletBinding()]
    [OutputType([psobject])]
    param()

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"

        $VssToService = @"
VssWriterName,ServiceName,ServiceDisplayName
ASR Writer,VSS,Volume Shadow Copy
BITS Writer,BITS,Background Intelligent Transfer Service
Certificate Authority,CertSvc,Active Directory Certificate Services
COM+ REGDB Writer,VSS,Volume Shadow Copy
DFS Replication service writer,DFSR,DFS Replication
DHCP Jet Writer,DHCPServer,DHCP Server
FRS Writer,NtFrs,File Replication
FSRM writer,srmsvc,File Server Resource Manager
IIS Config Writer,AppHostSvc,Application Host Helper Service
IIS Metabase Writer,IISADMIN,IIS Admin Service
Microsoft Exchange Replica Writer,MSExchangeRepl,Microsoft Exchange Replication Service
Microsoft Exchange Writer,MSExchangeIS,Microsoft Exchange Information Store
Microsoft Hyper-V VSS Writer,vmms,Hyper-V Virtual Machine Management
MSMQ Writer (MSMQ),MSMQ,Message Queuing
MSSearch Service Writer,WSearch,Windows Search
NPS VSS Writer,EventSystem,COM+ Event System
NTDS,NTDS,Active Directory Domain Services
OSearch VSS Writer,OSearch,Office SharePoint Server Search
OSearch14 VSS Writer,OSearch14,SharePoint Server Search 14
Registry Writer,VSS,Volume Shadow Copy
Shadow Copy Optimization Writer,VSS,Volume Shadow Copy
SMS Writer,SMS_SITE_VSS_WRITER,SMS_SITE_VSS_WRITER
SPSearch VSS Writer,SPSearch,Windows SharePoint Services Search
SPSearch4 VSS Writer,SPSearch4,SharePoint Foundation Search V4
SqlServerWriter,SQLWriter,SQL Server VSS Writer
System Writer,CryptSvc,Cryptographic Services
TermServLicensing,TermServLicensing,Remote Desktop Licensing
VSS Writer,Service Name,Related Windows Service To Restart
WDS VSS Writer,WDSServer,Windows Deployment Services Server
WIDWriter,WIDWriter,Windows Internal Database VSS Writer
WINS Jet Writer,WINS,Windows Internet Name Service (WINS)
WMI Writer,Winmgmt,Windows Management Instrumentation
"@ -split '\r?\n' | ConvertFrom-Csv

    }

    process {
        Write-Output -InputObject $VssToService
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
