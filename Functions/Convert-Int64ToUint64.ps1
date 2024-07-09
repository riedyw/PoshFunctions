function Convert-Int64ToUint64 {
    <#
.SYNOPSIS
    Converts int64 values to uint64 values
.DESCRIPTION
    Converts int64 values to uint64 values. Useful for handling 32 bitmasks returned from some functions like Get-Acl
.PARAMETER Number
    An array of int64 values
.PARAMETER IncludeInput
    Switch to include the input in the output
.EXAMPLE
    Convert-int64ToUint64 -Number -1610612736,-1,0x800000000000005b -IncludeInput

                   int64  Uint64
                   -----  ------
             -1610612736 18446744072098938880
                      -1 18446744073709551615
    -9223372036854775717  9223372036854775899
.EXAMPLE
    Convert-int64ToUint64 -Number -1610612736

    2684354560
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact = 'None', HelpURI='https://undernewmanagement.info/2021/06/pick-up-the-bow/')]
    Param(
        [parameter(Mandatory, HelpMessage = 'Enter hex color val RGB in form #RRGGBB', ValueFromPipeline)]
        [int64[]] $Number,

        [switch] $IncludeInput
    )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($curNumber in $Number) {
            $HexString = '{0:x}' -f $curNumber
            [int64] $power = 0
            [uint64] $ReturnVal = 0
            for ($i = ($Hexstring.length - 1); $i -ge 0; $i--) {
                $ReturnVal += ([int64] "0x$($Hexstring.Substring($i,1))" * [bigint]::Pow(16, $power))
                $power++
            }
            if ($IncludeInput) {
                New-Object -TypeName psobject -Property ([ordered] @{
                        int64  = $curNumber
                        Uint64 = $ReturnVal
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
