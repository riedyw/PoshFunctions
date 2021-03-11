function Convert-RGBToHex {
    <#
.SYNOPSIS
    Converts an RGB color string to hex equivalent
.DESCRIPTION
    Converts an RGB color string to hex equivalent. Input should be in the form 'A,R,G,B'
.PARAMETER RGB
    An RGB color string in the form '#,#,#,#' where each number is between 0 and 255.
.PARAMETER IncludeHash
    A switch indicating whether hex string should be preceded by a hash symbol #.
.PARAMETER IncludeInput
    A switch indicating whether to include the original decimal RGB input in the output, aliased to 'IncludeOriginal'
.NOTES
    Part of the ISEColorThemeCmdlets.ps1 Script by Jeff Pollock
    http://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e

    Modified:
    a) Changed name of parameter to RGB
    b) Added -IncludeHash parameter to make # optional.
    c) Minor tweaking so that it passes Invoke-ScriptAnalyzer
    d) Added parameter validation on RGB.
    e) Added .LINK entries for related items
.EXAMPLE
    Convert-RGBToHex -RGB '255,128,64,32'
    Would return
    FF804020
.EXAMPLE
    Convert-RGBToHex -RGB '255,255,0,0' -IncludeHash

    Would return
    #FFFF0000
.EXAMPLE
    convert-RGBtohex '255,64,128,255' -IncludeHash

    Would return
    #FF4080FF
.EXAMPLE
    '255,128,128,92' | convert-RGBtohex

    Would return
    FF80805C
.EXAMPLE
    Convert-RGBToHex -RGB @('255,0,0','255,128,80,80') -IncludeHash -IncludeInput

    Would return
    DecimalRGB   HexRGB
    -----------   -------
    0,255,0,0     #00FF0000
    255,128,80,80 #FF805050
.LINK
    about_ISE-Color-Theme-Cmdlets
.LINK
    Convert-HexToRGB
.OUTPUTS
    [string]
#>

    # todo parameter sets for rgb_string and integer r g b values
    # todo drop a from the string type
    #region Parameters
    [CmdletBinding(DefaultParameterSetName = 'String',ConfirmImpact = 'None')]
    [OutputType('string')]
    Param(
        [parameter(Mandatory, Position = 0, ParameterSetName = 'String', ValueFromPipeline)]
        [string[]] $RGB,

        [parameter(ParameterSetName = 'Colors', ValueFromPipelineByPropertyName)]
        [ValidateRange(0,255)]
        [Alias('R')]
        [int] $Red,

        [parameter(ParameterSetName = 'Colors', ValueFromPipelineByPropertyName)]
        [ValidateRange(0,255)]
        [Alias('G')]
        [int] $Green,

        [parameter(ParameterSetName = 'Colors', ValueFromPipelineByPropertyName)]
        [ValidateRange(0,255)]
        [Alias('B')]
        [int] $Blue,

        [parameter(ParameterSetName = 'String')]
        [parameter(ParameterSetName = 'Colors')]
        [switch] $Prefix,

        [parameter(ParameterSetName = 'String')]
        [parameter(ParameterSetName = 'Colors')]
        [switch] $IncludeInput
    )
    #endregion Parameters

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        if ($PsCmdlet.ParameterSetName -eq 'String') {
            foreach ($currentRGB in $RGB) {
                $currentRGB = $currentRGB -replace ' ', ''
                $currentError = $false
                try {
                    [int[]] $ColorArray = $currentRGB -split ','
                } catch {
                    Write-Error "[$currentRGB] is not a character string of 3 integers separated by a comma"
                    $currentError = $true
                }
                if ($ColorArray.count -ne 3) {
                    Write-Error "[$currentRGB] should be 3 integers separated by a comma"
                    $currentError = $true
                } else {
                    if ($ColorArray[0] -lt 0 -or $ColorArray[0] -gt 255) {
                        Write-Error "Red should be between 0 and 255"
                        $currentError = $true
                    }
                    if ($ColorArray[1] -lt 0 -or $ColorArray[1] -gt 255) {
                        Write-Error "Green should be between 0 and 255"
                        $currentError = $true
                    }
                    if ($ColorArray[2] -lt 0 -or $ColorArray[2] -gt 255) {
                        Write-Error "Blue should be between 0 and 255"
                        $currentError = $true
                    }
                    if (-not $currentError) {
                        $RedHex = '{0:X2}' -f ($ColorArray[0])
                        $GreenHex = '{0:X2}' -f ($ColorArray[1])
                        $BlueHex = '{0:X2}' -f ($ColorArray[2])
                        $Hex = $RedHex + $GreenHex + $BlueHex
                        if ($Prefix) {
                            $Hex = '#' + $Hex
                        }
                        if ($IncludeInput) {
                            New-Object -TypeName psobject -Property ([ordered] @{
                                RGB = $currentRGB
                                Hex = $Hex
                            })
                        } else {
                            Write-Output $Hex
                        }
                    }
                }
            }
        } else {
            $RedHex = '{0:X2}' -f $Red
            $GreenHex = '{0:X2}' -f $Green
            $BlueHex = '{0:X2}' -f $Blue
            $Hex = $RedHex + $GreenHex + $BlueHex
            if ($Prefix) {
                $Hex = '#' + $Hex
            }
            if ($IncludeInput) {
                New-Object -TypeName psobject -Property ([ordered] @{
                    Red = $Red
                    Green = $Green
                    Blue = $Blue
                    Hex = $Hex
                })
            } else {
                Write-Output $Hex
            }
        }

    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
