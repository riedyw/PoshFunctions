function ConvertTo-Hex {
<#
.SYNOPSIS
    Convert an integer or array of integers to hexadecimal
.DESCRIPTION
    Convert an integer or array of integers to hexadecimal
.PARAMETER Number
    An array of integers that you want converted to binary
.PARAMETER MinimumWidth
    Minimum number of characters that the binary representation will be. The binary number could be longer than the minimum width. Aliased to 'Width'.
.PARAMETER Prefix
    A string indicating the prefix you want included with the hex number. ValidateSet '0x', or '#'
.PARAMETER IncludeInput
    Switch indicating that you want the input to be included in the output

.EXAMPLE
    ConvertTo-Hex -Number 23

    17
.EXAMPLE
    ConvertTo-Hex -Number 32,32769 -IncludeInput

    Number Hex
    ------ ---
        32 20
     32769 8001
.EXAMPLE
    ConvertTo-Hex -Number 32, 32769 -IncludeInput -MinimumWidth 4 -Prefix '0x'

    Number Hex
    ------ ---
        32 0x0020
     32769 0x8001
.EXAMPLE
    ConvertTo-Hex -Number 128 -Prefix '#' -MinimumWidth 6

    #000080
.NOTES
    Changed to use unsigned 64 bit values so that larger numbers can be processed
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact = 'Low')]
    [OutputType('string')]
    Param(
        [Parameter(Mandatory, HelpMessage='Enter an integer value', Position = 0, ValueFromPipeline)]
        [uint64[]] $Number,

        [ValidateRange(1,255)]
        [Alias('Width')]
        [int] $MinimumWidth,

        [ValidateSet('#', '0x')]
        [string] $Prefix,

        [switch] $IncludeInput
    )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($curNumber in $Number) {
            $ReturnVal = ''
            if ($MinimumWidth) {
                $ReturnVal = "{0:x$MinimumWidth}" -f $curNumber
            } else {
                $ReturnVal = '{0:x}' -f $curNumber
            }
            if ($Prefix) {
                $ReturnVal = $Prefix + $ReturnVal
            }
            if ($IncludeInput) {
                New-Object -TypeName psobject -Property ([ordered] @{
                        Number = $curNumber
                        Hex = $ReturnVal
                })
            } else {
                Write-Output -InputObject $ReturnVal
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
