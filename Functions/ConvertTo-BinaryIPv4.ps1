function ConvertTo-BinaryIPv4 {
<#
.SYNOPSIS
    Converts a Decimal IP address into a binary format.
.DESCRIPTION
    ConvertTo-BinaryIP uses System.Convert to switch between decimal and binary format. The output from this function is dotted binary string.
.PARAMETER IPAddress
    An IPv4 Address to convert.
.PARAMETER IncludeInput
    A switch indicating if you want to display original IPv4 address. If true then it will output a PsObject with the property fields of IPv4 and Binary. Aliased to 'IncludeOriginal'
.EXAMPLE
    (PS)> ConvertTo-BinaryIPv4 -IPAddress 24.3.1.1

    Would return
    00011000.00000011.00000001.00000001
.EXAMPLE
    (PS)> ConvertTo-BinaryIPv4 -IPAddress 10.1.1.1,192.168.1.1  -verbose -IncludeInput

    Would return
    VERBOSE: IPv4Address entered [10.1.1.1,192.168.1.1]
    VERBOSE: You selected to include original value in output
    VERBOSE: Processing [10.1.1.1]
    VERBOSE: Binary representation [00001010.00000001.00000001.00000001]

    VERBOSE: Processing [192.168.1.1]
    VERBOSE: Binary representation [11000000.10101000.00000001.00000001]
    IPv4        Binary
    ----        ------
    10.1.1.1    00001010.00000001.00000001.00000001
    192.168.1.1 11000000.10101000.00000001.00000001
.EXAMPLE
    (PS)> "10.1.1.1","192.168.1.1" | ConvertTo-BinaryIPv4

    Would return
    00001010.00000001.00000001.00000001
    11000000.10101000.00000001.00000001
.INPUTS
    An IPv4Address or array of IPV4Address'es
.OUTPUTS
    [pscustomboject]
    [string]
.LINK
    [System.Net.IPAddress]
#>

    #region Parameter

    [CmdletBinding(ConfirmImpact = 'None')]
    [alias('ConvertTo-BinaryIP')] #FunctionAlias
    [OutputType('PsObject')]
    param(
        [Parameter(Mandatory,HelpMessage='Enter an IPv4 address', Position = 0, ValueFromPipeline)]
        [IPAddress[]] $IPAddress,

        [Parameter(Position = 1)]
        [Alias('IncludeOriginal')]
        [switch] $IncludeInput
    )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        Write-Verbose -Message "IPv4Address entered [$($ipaddress.ipAddressToString -join ',')]"
        if ($IncludeInput) {
            Write-Verbose -Message 'You selected to include original value in output'
        }
        foreach ($curIpAddress in $IPAddress) {
            Write-Verbose -Message "Processing [$($curIpAddress)]"
            $curBinary = ($curIpAddress.GetAddressBytes() | ForEach-Object { [Convert]::ToString($_, 2).PadLeft(8, '0') } ) -join '.'
            Write-Verbose -Message "Binary representation [$($curBinary)]"
            if ($IncludeInput) {
                New-Object -TypeName psobject -Property ([ordered] @{
                    IPv4   = $curIpAddress
                    Binary = $curBinary
                })
            } else {
                Write-Output -InputObject $curBinary
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

} #EndFunction ConvertTo-BinaryIPv4
