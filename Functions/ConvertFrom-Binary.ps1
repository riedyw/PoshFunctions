function ConvertFrom-Binary {
<#
.SYNOPSIS
    Convert an string or string array from binary to an integer
.DESCRIPTION
    Convert an string or string array from binary to an integer
.EXAMPLE
    ConvertFrom-Binary -Binary 100001

    33
.EXAMPLE
    ConvertFrom-Binary -Binary 1001 -include

    Binary Number
    ------ ------
    1001        9
.NOTES
    General notes
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact = 'Low')]
    [OutputType('int')]
    Param(
        [Parameter(Mandatory,HelpMessage='Enter a binary string', Position = 0, ValueFromPipeline)]
        [string[]] $Binary,

        [switch] $IncludeInput
    )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($curBinary in $Binary) {
            $ReturnVal = [convert]::ToInt32($curBinary, 2)
            if ($IncludeInput) {
                New-Object -TypeName psobject -Property ([ordered] @{
                        Binary = $curBinary
                        Number = $ReturnVal
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
