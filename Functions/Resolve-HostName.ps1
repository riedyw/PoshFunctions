function Resolve-HostName {
    <#
.SYNOPSIS
    Resolves a hostname to an IPv4 address.
.DESCRIPTION
    Specify a hostname as a parameter or pipelined in and it will resolve to an IPv4 address.
.PARAMETER Hostname
    The hostname(s) that you want resolved
.PARAMETER IncludeInput
    Switch that includes the input parameters in the output
.EXAMPLE
    Resolve-HostName -Hostname $env:computername
    # Display the IPv4 address of this computer
.EXAMPLE
    Resolve-HostName -Hostname .
    # Display the IPv4 address of this computer using '.' shorthand.
.EXAMPLE
    Resolve-HostName -Hostname "server1"
    # Display the IPv4 address of "server1"
.EXAMPLE
    $DomainController = (($env:logonserver).Substring(2))
    Resolve-HostName -Hostname $DomainController
    # Display the IPv4 address of the Active Directory Domain Controller that
    # you authenticated against when you logged onto Windows.
.EXAMPLE
    "server2" | Resolve-HostName
    # Display the IPv4 address of "server2" using the pipeline.
.EXAMPLE
    Resolve-HostName -Hostname server1, DOESNOTEXIST -IncludeInput

    Sample return
    Hostname     IPv4
    --------     ----
    server1      10.100.10.20
    doesnotexist False
#>
    [CmdletBinding()]
    Param (
        [parameter(ValueFromPipeLine, HelpMessage='Enter the hostname you want to resolve', ValueFromPipeLineByPropertyName, Mandatory)]
        [Alias('host','ComputerName')]
        [string[]] $Hostname,

        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($curHost in $Hostname) {
            if ($curHost -eq '.') {
                $curHost = $env:computername
            }
            $curHost = $curHost.ToLower()
            try {
                $ipv4 = ([System.Net.Dns]::GetHostAddresses($curHost) | Where-Object { $_.addressFamily -eq 'InterNetwork' } ).IPAddressToString
                if ($ipv4 -eq '92.242.140.21') {
                    $ipv4 = $false
                }
                # write-output $ipv4
                if (Test-IsValidIPv4 -IPAddress $ipv4 -Verbose:$false) {
                    if ($IncludeInput) {
                        New-Object -TypeName psobject -Property ([ordered] @{
                                Hostname = $curHost
                                IPv4     = $ipv4
                            })
                    } else {
                        Write-Output -InputObject $ipv4
                    }
                } else {
                    if ($IncludeInput) {
                        New-Object -TypeName psobject -Property ([ordered] @{
                                Hostname = $curHost
                                IPv4     = $false
                            })
                    } else {
                        Write-Output -InputObject $false
                    }
                }
            } catch {
                if ($IncludeInput) {
                    New-Object -TypeName psobject -Property ([ordered] @{
                            Hostname = $curHost
                            IPv4     = $false
                        })
                } else {
                    Write-Output -InputObject $false
                }
            }
        }

    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
