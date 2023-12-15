function ConvertTo-DecimalIPv4 {
<#
.SYNOPSIS
    Converts a Dotted Decimal IP address into a 32-bit unsigned integer.
.DESCRIPTION
    ConvertTo-DecimalIP takes a dotted decimal IP and uses the [ipaddress] accelerator to determine 32 bit decimal value.
    Function aliased to 'ConvertTo-DecimalIP'
.PARAMETER IPAddress
    An IP Address to convert.
.EXAMPLE
    ConvertTo-DecimalIPv4 -IPAddress 10.20.30.40

    Would return
    673059850
.EXAMPLE
    ConvertTo-DecimalIPv4 -IPAddress 192.168.1.1

    Would return
    16885952
.EXAMPLE


    Would return
    IPAddress   DecimalIP
    ---------   ---------
    192.168.1.1  16885952
    10.100.10.1  17458186
#>

    [CmdletBinding(ConfirmImpact='None')]
    [alias('ConvertTo-DecimalIP')] #FunctionAlias
    [OutputType('string')]
    param(
        [Parameter(Mandatory,HelpMessage='Please enter an IPv4 address', Position = 0, ValueFromPipeline)]
        [ipaddress[]] $IPAddress,

        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($curIPAddress in $IPAddress) {
            if ($IncludeInput) {
                New-Object -TypeName 'psobject' -Property ([ordered] @{
                        IPAddress = $curIPAddress
                        DecimalIP =$curIPAddress.Address
                    })
            } else {
                Write-Output -InputObject $curIPAddress.Address
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

} #EndFunction ConvertTo-DecimalIPv4
