# inspired by https://ss64.com/ps/syntax-set-eol.html
function Set-FileEncoding {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [string[]] $Path,

        [ValidateSet('ASCII', 'BigEndianUnicode', 'Unicode', 'UTF32', 'UTF7', 'UTF8')]
        [string] $EncodingType = 'ASCII',

        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
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
                        New-Object -TypeName psobject -Property ([ordered] @{
                            EncodingType = $EncodingType
                            Path = $CurrentResolve.Path
                        })
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
