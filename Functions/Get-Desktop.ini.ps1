function Get-Desktop.ini {
    <#
.SYNOPSIS
    Gets the current Desktop.ini file for a particular folder
.DESCRIPTION
    Gets the current Desktop.ini file for a particular folder from the hidden, system file Desktop.ini from the specified path
.PARAMETER Path
    The path to the folder
.EXAMPLE
    Assuming the file Desktop.ini exists in the current folder and contains:

    Get-Content -Path .\Desktop.ini
    [ViewState]
    Mode=
    Vid=
    FolderType=Generic

    [.ShellClassInfo]
    InfoTip=This is hover over text
    IconResource=TemporaryFolder2.ico,0

    Get-Desktop.ini

    Path    FolderType InfoTip                 IconResource
    ----    ---------- -------                 ------------
    C:\Temp Generic    This is hover over text TemporaryFolder2.ico,0
#>


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
