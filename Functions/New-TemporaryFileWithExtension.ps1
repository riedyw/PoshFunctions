function New-TemporaryFileWithExtension {
    <#
.SYNOPSIS
    Create a temporary file with a custom extension
.DESCRIPTION
    Create a temporary file with a custom extension. Returns an object of type [System.IO.FileInfo].
.PARAMETER Extension
    The desired extension for the temporary file. MUST begin with a '.' and NOT contain any embedded spaces.
.PARAMETER IncludeInput
    Return a psobject with the extension specified and resulting tempfile
.EXAMPLE
    New-TemporaryFileWithExtension -Extension .png -IncludeInput

    TempFile                                     Extension
    --------                                     ---------
    C:\Users\USER\AppData\Local\Temp\tmp189E.png .png
.NOTES
    Inspired by: https://david.gardiner.net.au/2018/08/create-temporary-file-with-custom.html

    Extension MUST begin with a '.' and NOT contain any embedded spaces. Forces extension to lower case.
    #>

    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding()]
    [OutputType([System.IO.FileInfo])]
    param (
        [Parameter(Mandatory, HelpMessage = 'Please enter the extension beginning with a "."', Position = 0)]
        [ValidateScript({
                if ($_ -notmatch '\.' -or $_ -match '\s') {
                    throw "[ERROR] The `$Extension specified [$_] either does not begin with '.' or there is an embedded space. Please fix."
                    $false
                } else {
                    $true
                }
            })]
        [string] $Extension,

        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $Extension = $Extension.ToLower()
    }

    process {
        $ReturnVal = New-TemporaryFile | Rename-Item -NewName { [System.IO.Path]::ChangeExtension($_, $Extension) } -PassThru
        if ($IncludeInput) {
            New-Object -TypeName psobject -Property ([ordered] @{
                TempFile  = $ReturnVal.FullName
                Extension = $Extension
                })
        } else {
            $ReturnVal
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
