function Resolve-FQDN {
<#
.SYNOPSIS
    Resolves a hostname or IPv4 address to a fully qualified domain name
.DESCRIPTION
    Resolves a hostname or IPv4 address to a fully qualified domain name
.PARAMETER ComputerName
    Either the hostname or IPv4 address of the computer you want resolved to FQDN. Aliased to 'CN', 'Host', 'Server'
.PARAMETER IncludeInput
    Switch to include the input parameters in the output
.EXAMPLE
    Resolve-FQDN -ComputerName $env:computername

    Display the FQDN of this computer
.EXAMPLE
    Resolve-FQDN -ComputerName '10.28.99.101'

    Display the FQDN of the computer whose IPv4 address is 10.28.99.101
.EXAMPLE
    Resolve-FQDN .

    Display the FQDN of this computer
.EXAMPLE
    '10.28.99.101' | Resolve-FQDN

    Display the FQDN of the computer whose IPv4 address is 10.28.99.101
.EXAMPLE
    $DomainController = (($env:logonserver).Substring(2))
    Resolve-FQDN $DomainController

    Display the FQDN of the Active Directory Domain Controller that you authenticated against when you logged onto Windows.
.EXAMPLE
    PS C:\> Resolve-FQDN -ComputerName "NonExistentPC"

    The computer "NonExistentPC" does not have an entry in DNS so the function will return the value $False
.NOTES
    Attempting to resolve a FQDN for a system that does not have an entry in DNS will be slow, and will take 1-5 seconds to return a value of $False
#>
    [CmdletBinding()]
    Param (
        [parameter(ValueFromPipeLine, HelpMessage='The name of the address you want to resolve the FQDN', ValueFromPipeLineByPropertyName, Mandatory)]
        [Alias('Host', 'CN', 'Server')]
        [string[]] $ComputerName,

        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($curComputer in $ComputerName) {
            if ($curComputer -eq '.') {
                $curComputer = $env:COMPUTERNAME
            }
            $curComputer = $curComputer.ToLower()
            try {
                $FQDN = [System.Net.Dns]::GetHostEntry($curComputer).HostName
                $FQDN = $FQDN.ToLower()
                #Write-Output -InputObject $FQDN
            } catch {
                $FQDN = 'Not found' #Write-Output -InputObject $False
            }
            if ($IncludeInput) {
                New-Object -TypeName psobject -Property ([ordered] @{
                        HostName = $curComputer
                        FQDN     = $FQDN
                    })
            } else {
                Write-Output -InputObject $FQDN
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
