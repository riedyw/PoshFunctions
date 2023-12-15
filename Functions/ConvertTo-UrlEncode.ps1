function ConvertTo-UrlEncode {
<#
.SYNOPSIS
    To encode plaintext using [Web.HttpUtility]::UrlEncode()
.DESCRIPTION
    To encode plaintext using [Web.HttpUtility]::UrlEncode()
.PARAMETER URL
    The original text that you want encoded. Can be a string or an array of strings. Accepts pipeline input.
.PARAMETER IncludeInput
    A switch to determine if you want original text in the output. Aliased to 'IncludeOriginal' for backward compatibility of scripts
.EXAMPLE
    ConvertTo-UrlEncode -URL https://www.google.com/

    Would return
    https%3a%2f%2fwww.google.com%2f
.EXAMPLE
    ConvertTo-UrlEncode -URL https://www.google.com/ -IncludeInput

    Would return
    PlainText               Encoded
    ---------               -------
    https://www.google.com/ https%3a%2f%2fwww.google.com%2f
#>

    [CmdletBinding()]
    [alias('UrlEncode')] #FunctionAlias
    param(
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
            $Encode = [Web.HttpUtility]::UrlEncode($currentURL)
            if ($IncludeInput) {
                New-Object -TypeName 'psobject' -Property ([ordered] @{
                        PlainText = $currentURL
                        Encoded   = $Encode
                    })
            } else {
                Write-Output -InputObject $Encode
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
