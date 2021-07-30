function Start-ADReplication {
    <#
.SYNOPSIS
    Forces replication to occur between domain controllers in domain.
.DESCRIPTION
    Forces replication to occur between domain controllers in domain. Invoke-command to a DC. Requires to be running in elevated Powershell prompt.
.PARAMETER Name
    A string array containing the name, fqdn or ipaddress of a domain controller. If not specified will query AD for a domain controller. Aliased to 'DomainController', 'DC', 'CN', 'ComputerName'
.EXAMPLE
    Start-ADReplication

    Will issue a call to Get-ADDomainController and run the replication against that one DC
.EXAMPLE
    Get-ADDomainController -Filter * | Start-ADReplication

    Will return a list of all DCs and run the replication against that list
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
    * Reworked logic so it just replicates the links that are defined. Previously it ran repadmin.exe with /ApeD switch and it was horribly slow.
    * Changed parameter $DC to $Name so that it would take input from Get-ADDomainController and to accept an array and added aliases to it
    * Changed output so that it would remove blank or commented lines from the output and to display what is being replicated in the output
#>

    #region parameter
    [CmdletBinding(ConfirmImpact = 'Medium')]
    [OutputType('string')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    Param
    (
        [parameter(Mandatory, HelpMessage = 'Please enter the name of a domain controller', ValueFromPipelineByPropertyName)]
        [Alias('DomainController', 'DC', 'CN', 'ComputerName')]
        [string[]] $Name
    )
    #endregion parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        if ($Name) {
            Write-Verbose -Message "`$Name is [$($Name -join ', ')]"
        }
    }

    process {
        "`"DestinationDSA`",`"SourceDSA`",`"NamingContext`",`"Message`""
        foreach ($CurName in $Name) {
            Write-Verbose -Message "Processing [$CurName]"
            Invoke-Command -ComputerName $CurName -ScriptBlock {
                $repl = repadmin.exe /showrepl /all /csv | ConvertFrom-Csv | Select-Object -Property 'Destination DSA', 'Source DSA', 'Naming Context'
                $repl | ForEach-Object {
                    $msg = "`"$($_.'Destination DSA')`",`"$($_.'Source DSA')`",`"$($_.'Naming Context')`""
                    repadmin.exe /replicate $_.'Destination DSA' $_.'Source DSA' "$($_.'Naming Context')" |
                        Where-Object { $_ -notmatch '^[\s]*$' } |
                        ForEach-Object { "$msg,`"$_`"" }
                }
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
