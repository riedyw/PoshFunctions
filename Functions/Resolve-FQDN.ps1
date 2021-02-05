Function Resolve-FQDN {
<#
.SYNOPSIS
    Resolves a hostname or IPv4 address to a fully qualified domain name
.DESCRIPTION
    Resolves a hostname or IPv4 address to a fully qualified domain name
.PARAMETER ComputerName
    Either the hostname or IPv4 address of the computer you want resolved to FQDN. Aliased to 'CN', and 'Host'
.EXAMPLE
    Resolve-FQDN -ComputerName $env:computername

    Display the FQDN of this computer
.EXAMPLE
    Resolve-FQDN -ComputerName "10.28.99.101"

    Display the FQDN of the computer whose IPv4 address is 10.28.99.101
.EXAMPLE
    Resolve-FQDN .

    Display the FQDN of this computer
.EXAMPLE
    "10.28.99.101" | Resolve-FQDN

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
        [parameter(ValueFromPipeLine,HelpMessage='Add help message for user',ValueFromPipeLineByPropertyName,Mandatory)]
        [Alias('Host','CN')]
        [string] $ComputerName
    )

    Begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    Process {
        if ($ComputerName -eq '.') {
            $ComputerName = $env:COMPUTERNAME
        }
        Try {
            $FQDN = [System.Net.Dns]::GetHostEntry($ComputerName).HostName
            write-output -InputObject $FQDN
        } Catch {
            Write-Output -InputObject $False
        }
    }

    End {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

} #EndFunction Resolve-FQDN
