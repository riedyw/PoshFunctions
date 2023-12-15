function ConvertTo-Base64 {
    <#
.SYNOPSIS
    ConvertTo-Base64 converts a normal string to a base 64 string
.DESCRIPTION
    ConvertTo-Base64 converts a normal string to a base 64 string. Function
    aliased to 'Base64Encode'.
.PARAMETER String
    The string you want manipulated
.PARAMETER IncludeInput
    Switch to enable input parameters to appear in output
.EXAMPLE
    ConvertTo-Base64 -String 'Password'

    Would return
    UABhAHMAcwB3AG8AcgBkAA==
.EXAMPLE
    ConvertTo-Base64 -String Hello,Goodbye -IncludeInput

    String  Base64
    ------  ------
    Hello   SABlAGwAbABvAA==
    Goodbye RwBvAG8AZABiAHkAZQA=
.OUTPUTS
    [string[]]
.LINK
    about_Properties
#>

    [CmdletBinding(ConfirmImpact = 'None')]
    [alias('Base64Encode')] #FunctionAlias
    param
    (
        [Parameter(ValueFromPipeline)]
        [string[]] $String,

        [ValidateSet('ASCII', 'BigEndianUnicode', 'Unicode', 'UTF32', 'UTF7', 'UTF8')]
        [string] $EncodingType = 'Unicode',

        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($curString in $String) {
            switch ($EncodingType) {
                'ASCII' {
                    $bytesto = [System.Text.Encoding]::Ascii.GetBytes($curString)
                }
                'BigEndianUnicode' {
                    $bytesto = [System.Text.Encoding]::BigEndianUnicode.GetBytes($curString)
                }
                'Unicode' {
                    $bytesto = [System.Text.Encoding]::Unicode.GetBytes($curString)
                }
                'UTF32' {
                    $bytesto = [System.Text.Encoding]::UTF32.GetBytes($curString)
                }
                'UTF7' {
                    $bytesto = [System.Text.Encoding]::UTF7.GetBytes($curString)
                }
                'UTF8' {
                    $bytesto = [System.Text.Encoding]::UTF8.GetBytes($curString)
                }
            }
            $encodedto = [System.Convert]::ToBase64String($bytesto)
            if ($IncludeInput) {
                New-Object -TypeName psobject -Property ([ordered] @{
                        String = $curString
                        Encoding = $EncodingType
                        Base64 = $encodedto
                    })
            } else {
                Write-Output -InputObject $encodedto
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
