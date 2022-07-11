function Start-ADReplication {
    <#
.SYNOPSIS
    Forces replication to occur between domain controllers in domain.
.DESCRIPTION
    Forces replication to occur between domain controllers in domain. Invoke-Command to a DC. Requires to be running in elevated Powershell prompt.
.PARAMETER Name
    A string array containing the name, fqdn or ipaddress of a domain controller. If not specified will query AD for a domain controller. Aliased to 'DomainController', 'DC', 'CN', 'ComputerName'
.PARAMETER Quiet
    Switch will create no output
.EXAMPLE
    Start-ADReplication

    Will issue a call to Get-ADDomainController and run the replication against that one DC
.EXAMPLE
    Get-ADDomainController -Filter * | Start-ADReplication

    Will return a list of all DCs and run the replication against that list
.EXAMPLE
    Get-ADDomainController -Filter "Name -like '*CORP*'" | Start-ADReplication

    Will return a list of all DCs that have 'CORP' in their name and run the replication against that list
.EXAMPLE
    Start-ADReplication -Name DC1 -Verbose

    Assuming there are two DCs (DC1, DC2) in the contosco.com domain here is a sample return
    VERBOSE: Starting [Start-ADReplication]
    VERBOSE: $Name is [DC1]
    VERBOSE: Processing [DC1]
    DC1 DC2 "DC=contosco,DC=com" - Sync from DC2 to DC1 completed successfully.
    DC1 DC2 "CN=Configuration,DC=contosco,DC=com" - Sync from DC2 to DC1 completed successfully.
    DC1 DC2 "CN=Schema,CN=Configuration,DC=contosco,DC=com" - Sync from DC2 to DC1 completed successfully.
    DC1 DC2 "DC=DomainDnsZones,DC=contosco,DC=com" - Sync from DC2 to DC1 completed successfully.
    DC1 DC2 "DC=ForestDnsZones,DC=contosco,DC=com" - Sync from DC2 to DC1 completed successfully.
    VERBOSE: Ending [Start-ADReplication]
.NOTES
    * Reworked logic so it just replicates the links that are defined. Previously it ran repadmin.exe with /ApeD switch
      and it was horribly slow.
    * Changed parameter $DC to $Name so that it would take input from Get-ADDomainController and to accept an array and
      added aliases to it
    * Changed output so that it would remove blank or commented lines from the output and to display what is being
      replicated in the output
    * Changed output so that it creates CSV output
    * Added '-ThrottleLimit' to the Invoke-Command so as to not saturate the local computer. Changed value to
      [environment]::ProcessorCount which is the number of processors on the computer.
#>

    # todo - add -Credential

    #region parameter
    [CmdletBinding(ConfirmImpact = 'Medium')]
    [OutputType('string')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseOutputTypeCorrectly', '')]
    Param
    (
        [parameter(Mandatory, HelpMessage = 'Please enter the name of a domain controller', ValueFromPipelineByPropertyName)]
        [Alias('DomainController', 'DC', 'CN', 'ComputerName')]
        [string[]] $Name,

        [switch] $Quiet
    )
    #endregion parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        if ($Name) {
            Write-Verbose -Message "`$Name is [$($Name -join ', ')]"
        }
        [int] $ThrottleLimit = [environment]::ProcessorCount
        $ScriptBlock = {
            $repl = repadmin.exe /showrepl /all /csv | ConvertFrom-Csv | Select-Object -Property 'Destination DSA', 'Source DSA', 'Naming Context'
            $repl | ForEach-Object {
                $msg = "`"$($_.'Destination DSA')`",`"$($_.'Source DSA')`",`"$($_.'Naming Context')`""
                repadmin.exe /replicate $_.'Destination DSA' $_.'Source DSA' "$($_.'Naming Context')" |
                    Where-Object { $_ -notmatch '^[\s]*$' } |
                    ForEach-Object { "$msg,`"$_`"" }
            }
        }
        if (-not $Quiet) {
            "`"DestinationDSA`",`"SourceDSA`",`"NamingContext`",`"Message`""
        }
    }

    process {
        foreach ($CurName in $Name) {
            Write-Verbose -Message "Processing [$CurName]"
            if ($Quiet) {
                $null = Invoke-Command -ComputerName $CurName -ThrottleLimit $ThrottleLimit -ScriptBlock $ScriptBlock
            } else {
                Invoke-Command -ComputerName $CurName -ThrottleLimit $ThrottleLimit -ScriptBlock $ScriptBlock
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
