function Set-Desktop.ini {
    [CmdletBinding()]
    param (
        [string] $Path = $pwd,

        [ValidateSet('Generic', 'Documents', 'Pictures', 'Music', 'Videos')]
        [string] $FolderType = 'Generic',

        [ValidateScript({
            if ($_.Length -gt 32) {
                throw 'ERROR: Maximum length for -InfoTip is 32 characters'
                $false
            } else {
                $true
            }
        })]
        [string] $InfoTip = '',

        [ValidateScript({
            if (Test-Path $_) {
                $true
            } else {
                throw "ERROR: Icon specified [$_] does not exist."
                $false
            }
        })]
        [string] $Icon = '',

        [switch] $CopyIcon
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        if (-not (Test-Path -Path $Path)) {
            Write-Error "Path [$Path] does not exist."
            break
        } elseif (-not (Get-Item -Path $Path).PsIsContainer) {
            Write-Error "Path [$Path] exists but is not a folder."
            break
        }
        if ($Icon -and (-not (Test-Path -Path $Icon))) {
            Write-Error "Icon [$Icon] does not exist."
            break
        }
    }

    process {
        $Desktop_ini = Join-Path -Path $Path -ChildPath 'Desktop.ini'
        if (-not (Test-Path -Path $Desktop_ini)) {
            Set-Content -Path $Desktop_ini -Value $null
        }
        Set-PrivateProfileString -File $Desktop_ini -Section 'ViewState' -Key 'Mode' -Value ''
        Set-PrivateProfileString -File $Desktop_ini -Section 'ViewState' -Key 'Vid' -Value ''
        if ($FolderType) {
            Set-PrivateProfileString -File $Desktop_ini -Section 'ViewState' -Key 'FolderType' -Value $FolderType
        }
        Set-PrivateProfileString -File $Desktop_ini -Section '.ShellClassInfo' -Key 'InfoTip' -Value $InfoTip
        if ($Icon) {
            $Icon = Resolve-Path -Path $Icon
            $IconFile = Get-Item -Path $Icon
            if ($CopyIcon) {
                Copy-Item -Path (Get-Item -Path $Icon) -Destination $Path
                $IconResource = $IconFile.Name + ',0'
            } else {
                $IconResource = $IconFile.FullName + ',0'
            }
            Set-PrivateProfileString -File $Desktop_ini -Section '.ShellClassInfo' -Key 'IconResource' -Value $IconResource
        }
        Add-FileAttribute -Path $Desktop_ini -FileAttribute 'Hidden', 'System'
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
