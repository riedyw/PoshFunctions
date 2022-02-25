function Convert-Int32ToUint32 {
    <#
.SYNOPSIS
    Converts int32 values to uint32 values
.DESCRIPTION
    Converts int32 values to uint32 values. Useful for handling 32 bitmasks returned from some functions like Get-Acl
.PARAMETER Number
    An array of int32 values
.PARAMETER IncludeInput
    Switch to include the input in the output
.EXAMPLE
    Convert-Int32ToUint32 -Number -1610612736,-1 -IncludeInput

          Int32     Uint32
          -----     ------
    -1610612736 2684354560
             -1 4294967295
.EXAMPLE
    Convert-Int32ToUint32 -Number -1610612736

    2684354560
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact = 'None')]
    Param(
        [parameter(Mandatory, HelpMessage = 'Enter hex color val RGB in form #RRGGBB', ValueFromPipeline)]
        [int32[]] $Number,

        [switch] $IncludeInput
    )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($curNumber in $Number) {
            $HexString = '{0:x}' -f $curNumber
            [int] $power = 0
            [uint32] $ReturnVal = 0
            for ($i = ($Hexstring.length - 1); $i -ge 0; $i--) {
                $ReturnVal += ([int] "0x$($Hexstring.Substring($i,1))") * (Get-Power -Base 16 -Power $power)
                $power++
            }
            if ($IncludeInput) {
                New-Object -TypeName psobject -Property ([ordered] @{
                        Int32  = $curNumber
                        Uint32 = $ReturnVal
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
