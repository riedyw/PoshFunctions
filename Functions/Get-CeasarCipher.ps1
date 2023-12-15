function Get-CeasarCipher {
    <#
.SYNOPSIS
    Shifts letters in string by a certain number of positions. Default shift is 13 characters or the classic ROT13.
.DESCRIPTION
    Shifts letters in string by a certain number of positions. Default shift is 13 characters or the classic ROT13.
.PARAMETER Text
    A string array of plaintext that you want to run through the cipher. Aliased to 'String' to provide backward compatibility.
.PARAMETER Key
    The number of positions you want to switch. Defaults to '13', valid range '1' through '25'
.PARAMETER Decode
    Switch used if you want to decode cipher text by a certain number of characters.
.PARAMETER IncludeInput
    Switch that will include the input in the output
.EXAMPLE
    Get-CeasarCipher -Text Zoo, human -IncludeInput -Verbose

    VERBOSE: Starting [Get-CeasarCipher]
    VERBOSE: -Key [13] -Decode [False] -IncludeInput [True]
    VERBOSE: Processing [Zoo]
    VERBOSE: Processing [human]
    VERBOSE: Ending [Get-CeasarCipher]
    PlainText Key CipherText
    --------- --- ----------
    Zoo        13 Mbb
    human      13 uhzna
.EXAMPLE
    Get-CeasarCipher -Text Zoo -Key 10

    Jyy
.EXAMPLE
    Get-CeasarCipher -Text Jyy -Key 10 -Decode

    Zoo
.NOTES
    Inspired by: https://titanwolf.org/Network/Articles/Article?AID=99197fe0-0b0e-4a9c-883e-49f4273a59ad#gsc.tab=0
#>

    [CmdletBinding()]
    [alias('Convert-ROT13')] #FunctionAlias

    Param
    (
        [Parameter(Mandatory, HelpMessage = 'Please enter text to pass through cipher', ValueFromPipeline)]
        [Alias('String')]
        [string[]] $Text,

        [ValidateRange(-25, 25)]
        [int] $Key = 13,

        [switch] $Decode,

        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.MyCommand)]"
        Write-Verbose -Message "-Key [$Key] -Decode [$Decode] -IncludeInput [$IncludeInput]"
        $LowerAlpha = ([char] 'a')..([char] 'z')
        $UpperAlpha = ([char] 'A')..([char] 'Z')
    }

    process {
        foreach ($Line in $Text) {
            Write-Verbose -Message "Processing [$Line]"
            $Chars = $Line.ToCharArray()
            $LineOutput = ''
            foreach ($Char in $Chars) {
                if ($Char -cmatch '[A-Z]') {
                    $Position = $UpperAlpha.IndexOf(([int] $char))
                    if (-not $Decode) {
                        $LineOutput += [char] $UpperAlpha[(($Position + $Key) % $UpperAlpha.Count)]
                    } else {
                        $LineOutput += [char] $UpperAlpha[(($Position - $Key + $UpperAlpha.Count) % $UpperAlpha.Count)]
                    }
                } elseif ($Char -cmatch '[a-z]') {
                    $Position = $LowerAlpha.IndexOf(([int] $char))
                    if (-not $Decode) {
                        $LineOutput += [char] $LowerAlpha[(($Position + $Key) % $LowerAlpha.Count)]
                    } else {
                        $LineOutput += [char] $LowerAlpha[(($Position - $Key + $LowerAlpha.Count) % $LowerAlpha.Count)]
                    }
                } else {
                    $LineOutput += $char
                }
            }
            if (-not $IncludeInput) {
                Write-Output -InputObject $LineOutput
            } else {
                New-Object -TypeName psobject -Property ([ordered] @{
                    PlainText = $Line
                    Key = $Key
                    CipherText = $LineOutput
                })
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.MyCommand)]"
    }
}
