function ConvertFrom-HtmlEncode {
<#
.SYNOPSIS
    Converts a URL encoded string back into a normal string
.DESCRIPTION
    Converts a HTML encoded string back into a normal string
.PARAMETER HTML
    The encoded HTML string. Can be a string or an array of strings. Accepts pipeline input.
.PARAMETER IncludeInput
    A switch to enable showing original text in the output. Aliased to 'IncludeOriginal' for backward compatibility of scripts
.EXAMPLE
    ConvertFrom-HTMLEncode -HTML '&amp;' -IncludeInput

    HtmlEncoded PlainText
    ----------- ---------
    &amp;       &
.OUTPUTS
    [string]
.NOTES
    Inspired by: https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/html-encoding
#>

    [CmdletBinding(ConfirmImpact = 'None')]
    [OutputType('string')]
    Param(
        [Parameter(ValueFromPipeline)]
        [string[]] $HTML,

        [Alias('IncludeOriginal')]
        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($currentHTML in $HTML) {
            $Decode = [System.Web.HttpUtility]::HtmlDecode($currentHTML)
            if ($IncludeInput) {
                New-Object -TypeName 'psobject' -Property ([ordered] @{
                        HtmlEncoded = $currentHTML
                        PlainText = $Decode
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
