function Get-IpV4Network {
<#
.SYNOPSIS
    Determine the IPv4 network given an ip address and a subnet mask
.DESCRIPTION
    Determine the IPv4 network given an ip address and a subnet mask
.PARAMETER IpAddress
    An IP address (or array of addresses) that you want to determine the network of
.PARAMETER SubnetMask
    An IP subnet mask. Defaults to: '255.255.255.0'
.PARAMETER IncludeInput
    Switch to determine if you want the input as part of the output
.EXAMPLE
    Get-IpV4Network -IpAddress 10.10.10.200 -SubnetMask 255.255.255.128

    10.10.10.128
.EXAMPLE
    Get-IpV4Network -IpAddress 10.10.10.200, 192.168.1.32 -SubnetMask 255.255.255.0 -IncludeInput

    IpAddress    SubnetMask    Network
    ---------    ----------    -------
    10.10.10.200 255.255.255.0 10.10.10.0
    192.168.1.32 255.255.255.0 192.168.1.0
#>

        [CmdletBinding(ConfirmImpact = 'None')]
        Param(
            [Parameter(Mandatory, HelpMessage = 'Please enter an IpAddress in the form a.b.c.d', ValueFromPipeline, Position = 0)]
            [alias('Address')]
            [ipaddress[]] $IpAddress,

            [alias('Sn')]
            [ipaddress] $SubnetMask = '255.255.255.0',

            [switch] $IncludeInput
        )

        begin {
            Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        }

        process {
            foreach ($item in $IpAddress) {
                $Result = ([ipaddress] ($item.address -band $SubnetMask.address)).IPAddressToString
                if ($IncludeInput) {
                    New-Object -TypeName psobject -Property ([ordered] @{
                        IpAddress = $item.IPAddressToString
                        SubnetMask = $SubnetMask.IPAddressToString
                        Network = $Result
                    })
                } else {
                    $Result
                }
            }
        }

        end {
            Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
        }
    }
