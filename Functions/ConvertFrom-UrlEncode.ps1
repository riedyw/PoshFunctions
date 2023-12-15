function ConvertFrom-UrlEncode {
<#
.SYNOPSIS
    Converts a URL encoded string back into a normal string
.DESCRIPTION
    Converts a URL encoded string back into a normal string
.PARAMETER URL
    The encoded URL string. Can be a string or an array of strings. Accepts pipeline input.
.PARAMETER IncludeInput
    A switch to enable showing original text in the output. Aliased to 'IncludeOriginal' for backward compatibility of scripts
.EXAMPLE
    ConvertFrom-UrlEncode -URL 'https%3a%2f%2fwww.google.com%2f'

    Would return
    https://www.google.com/
.EXAMPLE
    ConvertFrom-UrlEncode -URL 'https%3a%2f%2fbing.com' -IncludeInput

    Would return
    Encoded                Decoded
    -------                -------
    https%3a%2f%2fbing.com https://bing.com
.EXAMPLE
    ConvertFrom-UrlEncode -URL 'https%3a%2f%2fbing.com', 'https%3a%2f%2fwww.google.com%2f' -IncludeInput

    Would return
    Encoded                         Decoded
    -------                         -------
    https%3a%2f%2fbing.com          https://bing.com
    https%3a%2f%2fwww.google.com%2f https://www.google.com/
.OUTPUTS
    [string]
#>

    [CmdletBinding(ConfirmImpact = 'None')]
    [alias('UrlDecode')] #FunctionAlias
    [OutputType('string')]
    Param(
        [Parameter(ValueFromPipeline)]
        [string[]] $URL,

        [Alias('IncludeOriginal')]
        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($currentURL in $URL) {
            $Decode = [System.Web.HttpUtility]::UrlDecode($currentURL)
            if ($IncludeInput) {
                New-Object -TypeName 'psobject' -Property ([ordered] @{
                        Encoded = $currentURL
                        Decoded = $Decode
                    })
            } else {
                Write-Output -InputObject $Decode
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
