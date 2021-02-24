function Remove-BomFromFile {
<#
.SYNOPSIS
    To remove BOM (byte order marking) from a file.
.DESCRIPTION
    To remove BOM (byte order marking) from a file.
.PARAMETER Path
    The path to the source file.
.PARAMETER Destination
    The path to the destination file.
.EXAMPLE
    Remove-BomFromFiles -Path .\UTF8-BOM.txt -Destination .\UTF.txt

    Takes the contents of .\UTF8-BOM.txt, removes the byte order marking
    and writes to .\UTF8.txt
.NOTES
    # Source: http://community.idera.com/powershell/powertips/b/tips/posts/dealing-with-file-encoding-and-bom
#>

    [CmdletBinding()]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions','')]
    param
    (
        [Alias('OldPath')]
        [string] $Path,

        [Alias('NewPath')]
        [string] $Destination
    )

    $Content = Get-Content -Path $Path -Raw
    $Utf8NoBomEncoding = New-Object -TypeName System.Text.UTF8Encoding -ArgumentList $False
    [System.IO.File]::WriteAllLines($Destination, $Content, $Utf8NoBomEncoding)
}
