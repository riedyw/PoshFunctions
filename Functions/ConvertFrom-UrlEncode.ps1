Function ConvertFrom-UrlEncode {
<#
.SYNOPSIS
    Converts a URL encoded string back into a normal string
.DESCRIPTION
    Converts a URL encoded string back into a normal string
.PARAMETER URL
    The encoded URL string. Can be a string or an array of strings. Accepts pipeline input.
.PARAMETER IncludeOriginal
    A switch to enable showing original text in the output.
.EXAMPLE
    ConvertFrom-UrlEncode -URL 'https%3a%2f%2fwww.google.com%2f'

    Would return
    https://www.google.com/
.EXAMPLE
    ConvertFrom-UrlEncode -URL 'https%3a%2f%2fbing.com' -IncludeOriginal

    Would return
    Encoded                Decoded
    -------                -------
    https%3a%2f%2fbing.com https://bing.com
.OUTPUTS
    [string]
.LINK
    about_Properties
#>

    [CmdletBinding(ConfirmImpact='None')]
    Param(
        [Parameter(ValueFromPipeline)]
        [string[]] $URL,

        [switch] $IncludeOriginal
    )

    begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    process {
        foreach ($currentURL in $URL) {
            $Decode = [System.Web.HttpUtility]::UrlDecode($currentURL)
        }
        if ($IncludeOriginal) {
            new-object -TypeName 'psobject' -Property ([ordered] @{
                Encoded = $currentURL
                Decoded = $Decode
            })
        } else {
            $Decode
        }
    }

    end {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

}

Set-Alias -Name 'UrlDecode' -Value 'ConvertFrom-UrlEncode' -Description 'Alias for ConvertFrom-UrlEncode'
