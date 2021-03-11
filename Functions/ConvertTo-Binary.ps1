function ConvertTo-Binary {
<#
.SYNOPSIS
    Convert an integer or array of integers to binary
.DESCRIPTION
    Convert an integer or array of integers to binary
.EXAMPLE
    ConvertTo-Binary -Number 23

    10111
.EXAMPLE
    ConvertTo-Binary -Number 32,0xff -IncludeInput

    Number Binary
    ------ ------
        32 100000
       255 11111111
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
            $ReturnVal = [convert]::ToString($curNumber, 2)
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
