function Expand-IPV6 {
<#
.SYNOPSIS
    Takes an abbreviated IPv6 string and expands it fully
.DESCRIPTION
    Takes an abbreviated IPv6 string and expands it fully
.PARAMETER IPv6
    A string parameter that represents an IPv6 address. Aliased to 'Address'
.PARAMETER IncludeInput
    Switch that will display the input parameter along with the result
.EXAMPLE
    Expand-IPV6 'fe98::726d:daad:2afc:5393%18'

    Would return:
    FE98:0000:0000:0000:726D:DAAD:2AFC:0000
.EXAMPLE
    Expand-IPV6 'fe98::726d:daad:2afc:5393'

    Would return:
    FE98:0000:0000:0000:726D:DAAD:2AFC:5393
.EXAMPLE
    Expand-IPV6 -IPv6 '::1'

    Would return:
    0000:0000:0000:0000:0000:0000:0000:0001
.EXAMPLE
    '::1', 'fe98::726d:daad:2afc:5393' | Expand-IPV6  -IncludeInput

    OriginalIPv6              ExpandedIPv6
    ------------              ------------
    ::1                       0000:0000:0000:0000:0000:0000:0000:0001
    fe98::726d:daad:2afc:5393 FE98:0000:0000:0000:726D:DAAD:2AFC:5393
.NOTES
    Source: https://badflyer.com/powershell-ipv4-to-ipv6/

    Changes:
    - added comment help
    - minor formatting changes
    - change IPv6 to string array
    - added IncludeInput parameter
#>

    [CmdletBinding()]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments','')]
    param
    (
        [Parameter(Mandatory, HelpMessage='Enter an IPv6 address', Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [Alias('Address')]
        [string[]] $IPv6,

        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($curIPv6 in $IPv6) {
            $count = 0
            $loc = -1
            # Count the number of colons, and keep track of the double colon
            for ($i = 0; $i -lt $curIPv6.Length; $i++) {
                if ($curIPv6[$i] -eq ':') {
                    $count++
                    if (($i - 1) -ge 0 -and $curIPv6[$i - 1] -eq ':') {
                        $loc = $i
                    }
                }
            }
            # If we didnt find a double colon and the count isn't 7, then throw an exception
            if ($loc -lt 0 -and $count -ne 7) {
                throw 'ERROR: Invalid IPv6 Address'
            }
            # Add in any missing colons if we had a double
            $cleaned = $curIPv6
            if ($count -lt 7) {
                $cleaned = $curIPv6.Substring(0, $loc) + (':' * (7 - $count)) + $curIPv6.Substring($loc)
            }
            # Parse current values in fill in new IP with hex numbers padded to 4 digits
            $result = New-Object -TypeName System.Collections.Arraylist
            foreach ($splt in $cleaned -split ':') {
                $val = 0
                $r = [int]::TryParse($splt, [System.Globalization.NumberStyles]::HexNumber, [System.Globalization.CultureInfo]::InvariantCulture, [ref]$val)
                $null = $result.Add(('{0:X4}' -f $val))
            }
            $result = $result -join ':'
            if ($IncludeInput) {
                New-Object -TypeName psobject -Property ([ordered] @{
                    OriginalIPv6 = $curIPv6
                    ExpandedIPv6 = $result
                })
            } else {
                Write-Output -InputObject $result
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
