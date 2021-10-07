function ConvertTo-Binary {
<#
.SYNOPSIS
    Convert an integer or array of integers to binary
.DESCRIPTION
    Convert an integer or array of integers to binary
.PARAMETER Number
    An array of integers that you want converted to binary
.PARAMETER MinimumWidth
    Minimum number of characters that the binary representation will be. The binary number could be longer than the minimum width. Aliased to 'Width'.
.PARAMETER IncludeInput
    Switch indicating that you want the input to be included in the output
.EXAMPLE
    ConvertTo-Binary -Number 23

    10111
.EXAMPLE
    ConvertTo-Binary -Number 32,0xff -IncludeInput

    Number Binary
    ------ ------
        32 100000
       255 11111111
.EXAMPLE
    ConvertTo-binary -Number 32,0xff -IncludeInput -MinimumWidth 16

    Number Binary
    ------ ------
        32 0000000000100000
       255 0000000011111111
.NOTES
    Changed to use unsigned 64 bit values so that larger numbers can be processed
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact = 'Low')]
    [OutputType('string')]
    Param(
        [Parameter(Mandatory,HelpMessage='Enter an integer value(s)', Position = 0, ValueFromPipeline)]
        [uint64[]] $Number,

        [ValidateRange(1,255)]
        [Alias('Width')]
        [int] $MinimumWidth,

        [switch] $IncludeInput
    )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($curNumber in $Number) {
            $ReturnVal = [convert]::ToString($curNumber, 2)
            if ($MinimumWidth) {
                $ReturnVal = $ReturnVal.PadLeft($MinimumWidth, '0')
            }
            if ($IncludeInput) {
                New-Object -TypeName psobject -Property ([ordered] @{
                        Number = $curNumber
                        Binary = $ReturnVal
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
