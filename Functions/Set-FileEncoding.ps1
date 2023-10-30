# inspired by https://ss64.com/ps/syntax-set-eol.html
function Set-FileEncoding {
    <#
    .SYNOPSIS
    Can change the file encoding of a file from say ASCII to Unicode
    .DESCRIPTION
    Can change the file encoding of a file from say ASCII to Unicode
    .PARAMETER Path
    The path to the file(s)
    .PARAMETER EncodingType
    Selects the encoding type. Validate set: 'ASCII', 'BigEndianUnicode', 'Unicode', 'UTF32', 'UTF7', 'UTF8'
    Defaults to 'ASCII'
    .PARAMETER Quiet
    If specified there will be no output produced by the function
    .EXAMPLE
    Set-FileEncoding -Path c:\temp\tempfile.txt -EncodingType Unicode

    EncodingType Path
    ------------ ----
    Unicode      C:\temp\tempfile.txt
  #>


    [CmdletBinding(ConfirmImpact = 'High')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    Param(
        [Parameter(Mandatory)]
        [string[]] $Path,

        [ValidateSet('ASCII', 'BigEndianUnicode', 'Unicode', 'UTF32', 'UTF7', 'UTF8')]
        [string] $EncodingType = 'ASCII',

        [switch] $Quiet
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "EncodingType specified as [$EncodingType]"
        switch ($EncodingType) {
            'ASCII' {
                $Encoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Ascii
            }
            'BigEndianUnicode' {
                $Encoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::BigEndianUnicode
            }
            'Unicode' {
                $Encoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::Unicode
            }
            'UTF32' {
                $Encoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::UTF32
            }
            'UTF7' {
                $Encoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::UTF7
            }
            'UTF8' {
                $Encoding = [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]::UTF8
            }
        }
    }

    process {
        foreach ($CurPath in $Path) {
            if (Test-Path -Path $CurPath) {
                $ResolveFile = Resolve-Path -Path $CurPath
                foreach ($CurrentResolve in $ResolveFile) {
                    if (-not (Get-Item -Path $CurrentResolve.Path).PSIsContainer) {
                        if (-not $Quiet) {
                            New-Object -TypeName psobject -Property ([ordered] @{
                                    EncodingType = $EncodingType
                                    Path         = $CurrentResolve.Path
                                })
                        }
                        $text = Get-Content -Path $CurrentResolve.Path
                        Start-Sleep -Milliseconds 50
                        $text | Set-Content -Path $CurrentResolve.Path -Encoding $Encoding
                    } else {
                        Write-Error -Message "ERROR: File [$CurrentResolve] is a directory. Skipping..."
                    }
                }
            } else {
                Write-Error -Message "ERROR: Path [$CurPath] does not exist"
            }
        }

    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
