function Get-IpV4Network {
    <#
    .SYNOPSIS
        Given a subnet in CIDR format, get all of the valid IP addresses in that range.
    .DESCRIPTION
        Given a subnet in CIDR format, get all of the valid IP addresses in that range.
    .PARAMETER Subnets
        The subnet written in CIDR format 'a.b.c.d/#' and an example would be '192.168.1.24/27'. Can be a single value, an
        array of values, or values can be taken from the pipeline.
    .EXAMPLE
        Get-IpRange -Subnets '192.168.1.24/30'

        192.168.1.25
        192.168.1.26
    .EXAMPLE
        (Get-IpRange -Subnets '10.100.10.0/24').count

        254
    .EXAMPLE
        '192.168.1.128/30' | Get-IpRange

        192.168.1.129
        192.168.1.130
    .NOTES
        Inspired by https://gallery.technet.microsoft.com/PowerShell-Subnet-db45ec74

        * Added comment help
    #>

        # todo Change += to System.Collections.Arraylist

        [CmdletBinding(ConfirmImpact = 'None')]
        Param(
            [Parameter(Mandatory, HelpMessage = 'Please enter a subnet in the form a.b.c.d/#', ValueFromPipeline, Position = 0)]
            [alias('Address')]
            [ipaddress[]] $IpAddress,

            [alias('Sn')]
            [ipaddress] $SubnetMask,

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
