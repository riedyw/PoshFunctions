function ConvertFrom-Hex {
<#
.SYNOPSIS
    Convert an string or string array from hexadecimal to an integer
.DESCRIPTION
    Convert an string or string array from hexadecimal to an integer
.EXAMPLE
    ConvertFrom-Hex -Hex 'f0','20'

    240
    32
.EXAMPLE
    ConvertFrom-Hex -Hex '0xff','20' -IncludeInput

    Hex  Number
    ---  ------
    0xff    255
    20       32
.NOTES
    Changed to use unsigned 64 bit values so that larger numbers can be processed
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact = 'Low')]
    [OutputType('int')]
    Param(
        [Parameter(Mandatory,HelpMessage='Enter a hexadecimal string', Position = 0, ValueFromPipeline)]
        [string[]] $Hex,

        [switch] $IncludeInput
    )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($curHex in $Hex) {
            $ReturnVal = [convert]::ToUInt64($curHex, 16)
            if ($IncludeInput) {
                New-Object -TypeName psobject -Property ([ordered] @{
                        Hex  = $curHex
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
