function ConvertTo-Hex {
<#
.SYNOPSIS
    Convert an integer or array of integers to binary
.DESCRIPTION
    Convert an integer or array of integers to binary
.EXAMPLE
    ConvertTo-Hex-Number 23

    17
.EXAMPLE
    ConvertTo-Hex -Number 32,32769 -IncludeInput

    Number Hex
    ------ ---
        32 20
     32769 8001
.NOTES
    General notes
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact = 'Low')]
    [OutputType('string')]
    Param(
        [Parameter(Mandatory, Position = 0, ValueFromPipeline)]
        [int[]] $Number,

        [switch] $IncludeInput
    )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($curNumber in $Number) {
            $ReturnVal = [convert]::ToString($curNumber, 16)
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
