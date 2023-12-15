function Convert-HexToRGB {
<#
.SYNOPSIS
    Converts Hex to RGB values
.DESCRIPTION
    Converts Hex to RGB values
.PARAMETER Hex
    An 6 character Hex value with optional # prefix
.PARAMETER IncludeInput
    Switch to include the input in the output
.EXAMPLE
    Convert-HexToRGB -Hex '#ffffff' -IncludeInput

    Hex     Red Green Blue RgbString
    ---     --- ----- ---- ---------
    #ffffff 255   255  255 255,255,255
.EXAMPLE
    Convert-HexToRGB -Hex '808080'

    128,128,128
.EXAMPLE
    Convert-HexToRGB -Hex '808080', 'ffffff', '#abab10' -IncludeInput

    Hex     Red Green Blue RgbString
    ---     --- ----- ---- ---------
    808080  128   128  128 128,128,128
    ffffff  255   255  255 255,255,255
    #abab10 171   171   16 171,171,16
.NOTES
    Updated to change delimiter from ',' to ', ' so as to properly export to CSV and then read into Excel
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact = 'None')]
    Param(
        [parameter(Mandatory, HelpMessage = 'Enter hex color val RGB in form #RRGGBB', ValueFromPipeline)]
        [string[]] $Hex,

        [switch] $IncludeInput
    )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($curHex in $Hex) {
            if ($curHex -match '(#)?([0-9A-F]{6})') {
                #-Convert values
                $Red   = [Convert]::ToInt32($matches[2].Substring(0, 2), 16)
                $Green = [Convert]::ToInt32($matches[2].Substring(2, 2), 16)
                $Blue  = [Convert]::ToInt32($matches[2].Substring(4, 2), 16)

                if ($IncludeInput) {
                    New-Object -TypeName psobject -Property ([ordered] @{
                        Hex       = $curHex
                        Red       = $Red
                        Green     = $Green
                        Blue      = $Blue
                        RgbString = @($Red, $Green, $Blue) -join ', '
                    })
                } else {
                    Write-Output -InputObject ( @($Red, $Green, $Blue) -join ', ' )
                }
            } else {
                Write-Error -Message "$curHex is not a valid Hex color string"
                break
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
