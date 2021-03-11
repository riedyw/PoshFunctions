function Convert-ARGBToHex {
    <#
.SYNOPSIS
    Converts an ARGB color string to hex equivalent
.DESCRIPTION
    Converts an ARGB color string to hex equivalent. Input should be in the form 'A,R,G,B'
.PARAMETER ARGB
    An ARGB color string in the form '#,#,#,#' where each number is between 0 and 255.
.PARAMETER IncludeHash
    A switch indicating whether hex string should be preceded by a hash symbol #.
.PARAMETER IncludeInput
    A switch indicating whether to include the original decimal ARGB input in the output, aliased to 'IncludeOriginal'
.NOTES
    Part of the ISEColorThemeCmdlets.ps1 Script by Jeff Pollock
    http://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e

    Modified:
    a) Changed name of parameter to ARGB
    b) Added -IncludeHash parameter to make # optional.
    c) Minor tweaking so that it passes Invoke-ScriptAnalyzer
    d) Added parameter validation on ARGB.
    e) Added .LINK entries for related items
.EXAMPLE
    Convert-ARGBToHex -ARGB '255,128,64,32'
    Would return
    FF804020
.EXAMPLE
    Convert-ARGBToHex -ARGB '255,255,0,0' -IncludeHash

    Would return
    #FFFF0000
.EXAMPLE
    convert-argbtohex '255,64,128,255' -IncludeHash

    Would return
    #FF4080FF
.EXAMPLE
    '255,128,128,92' | convert-argbtohex

    Would return
    FF80805C
.EXAMPLE
    Convert-ARGBToHex -ARGB @('255,0,0','255,128,80,80') -IncludeHash -IncludeInput

    Would return
    DecimalARGB   HexARGB
    -----------   -------
    0,255,0,0     #00FF0000
    255,128,80,80 #FF805050
.LINK
    about_ISE-Color-Theme-Cmdlets
.LINK
    Convert-HexToARGB
.OUTPUTS
    [string]
#>

    # todo parameter sets for rgb_string and integer r g b values
    # todo drop a from the string type
    #region Parameters
    [CmdletBinding(ConfirmImpact = 'None')]
    [OutputType('string')]
    Param(
        [parameter(Mandatory, Position = 0, ValueFromPipeline)]
        [string[]] $ARGB,

        [switch] $IncludeHash,

        [Alias('IncludeOriginal')]
        [switch] $IncludeInput
    )
    #endregion Parameters

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($currentARGB in $ARGB) {
            $currentARGB = $currentARGB -replace ' ', ''
            if ( $currentARGB -match '^\d{1,3}\,\d{1,3}\,\d{1,3}\,\d{1,3}$') {
                #$true
            } else {
                if ( $currentARGB -match '^\d{1,3}\,\d{1,3}\,\d{1,3}$') {
                    $currentARGB = "0,$currentARGB"
                    #$true
                } else {
                    throw "You must provide an ARGB string value in the form '#,#,#,#' where each number is between 0 and 255"
                }
            }
            Write-Verbose -Message "Current `$ARGB = [$currentARGB]"
            #-separate the ARGB values
            $var_ARGB = $currentARGB.split(',')

            #-Convert values to Hex
            $var_A = '{0:X2}' -f ([int] $var_ARGB[0])
            $var_R = '{0:X2}' -f ([int] $var_ARGB[1])
            $var_G = '{0:X2}' -f ([int] $var_ARGB[2])
            $var_B = '{0:X2}' -f ([int] $var_ARGB[3])

            #-Output concatenated hex value
            if ($IncludeHash) {
                $ReturnVal = "#$var_A$var_R$var_G$var_B"
            } else {
                $ReturnVal = "$var_A$var_R$var_G$var_B"
            }

            if ($IncludeInput) {
                New-Object -TypeName 'psobject' -Property @{
                    DecimalARGB = $currentARGB
                    HexARGB     = $ReturnVal
                }
            } else {
                write-output $ReturnVal
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

} #EndFunction Convert-ARGBToHex
