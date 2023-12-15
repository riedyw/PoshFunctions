function Get-Desktop.ini {
    [CmdletBinding()]
    param (
        [string] $Path = $pwd
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
    }

    process {
        $Desktop_ini = Join-Path -Path $Path -ChildPath 'Desktop.ini'
        if (-not (Test-Path -Path $Desktop_ini)) {
            Write-Error "No Desktop.ini found in [$Path]."
            break
        }
        $Path = (Resolve-Path -Path $Path).Path
        $FolderType = Get-PrivateProfileString -File $Desktop_ini -Section 'ViewState' -Key 'FolderType'
        $InfoTip = Get-PrivateProfileString -File $Desktop_ini -Section '.ShellClassInfo' -Key 'InfoTip'
        $IconResource = Get-PrivateProfileString -File $Desktop_ini -Section '.ShellClassInfo' -Key 'IconResource'
        New-Object -TypeName psobject -Property ([ordered] @{
            Path = $Path
            FolderType = $FolderType
            InfoTip = $InfoTip
            IconResource = $IconResource
        })
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
