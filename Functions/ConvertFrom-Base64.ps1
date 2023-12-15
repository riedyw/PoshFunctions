function ConvertFrom-Base64 {
<#
.SYNOPSIS
    Convert from a Base64 string to normal string
.DESCRIPTION
    Convert from a Base64 string to normal string. Function aliased to 'Base64Decode'.
.PARAMETER Base64
    A base64 encoded string
.PARAMETER IncludeInput
    Switch to enable including the input to appear in the output
.EXAMPLE
    ConvertFrom-Base64 "SABlAGwAbABvAA=="

    Would return
    Hello
.EXAMPLE
    ConvertFrom-Base64 "SABlAGwAbABvAA==" -IncludeInput

    Would return
    Base64           String
    ------           ------
    SABlAGwAbABvAA== Hello
.OUTPUTS
    [string[]]
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact='None')]
    [alias('Base64Decode')] #FunctionAlias
    Param(
        [Parameter(Position = 0, Mandatory, ValueFromPipeLine)]
        [string[]] $Base64,

        [ValidateSet('ASCII', 'BigEndianUnicode', 'Unicode', 'UTF32', 'UTF7', 'UTF8')]
        [string] $EncodingType = 'Unicode',

        [switch] $IncludeInput
    )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    } #close begin block

    process {
        foreach ($curBase64 in $Base64) {
            $bytesfrom = [Convert]::FromBase64String($curBase64)
            switch ($EncodingType) {
                'ASCII' {
                    $decodedfrom = [System.Text.Encoding]::Ascii.GetString($bytesfrom)
                }
                'BigEndianUnicode' {
                    $decodedfrom = [System.Text.Encoding]::BigEndianUnicode.GetString($bytesfrom)
                }
                'Unicode' {
                    $decodedfrom = [System.Text.Encoding]::Unicode.GetString($bytesfrom)
                }
                'UTF32' {
                    $decodedfrom = [System.Text.Encoding]::UTF32.GetString($bytesfrom)
                }
                'UTF7' {
                    $decodedfrom = [System.Text.Encoding]::UTF7.GetString($bytesfrom)
                }
                'UTF8' {
                    $decodedfrom = [System.Text.Encoding]::UTF8.GetString($bytesfrom)
                }
            }
            $decodedfrom = [Text.Encoding]::Unicode.GetString($bytesfrom)
            if ($IncludeInput) {
                New-Object -TypeName psobject -Property ([ordered] @{
                    Base64 = $curBase64
                    Encoding = $EncodingType
                    String = $decodedfrom
                })
            } else {
                Write-Output -InputObject $decodedfrom
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
