function Get-Shortcut {
<#
.SYNOPSIS
    Get information about a Shortcut (.lnk file)
.DESCRIPTION
    Get information about a Shortcut (.lnk file)
.EXAMPLE
    Get-Shortcut -Path 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Excel.lnk'

    Link         : Excel.lnk
    TargetPath   : C:\Program Files (x86)\Microsoft Office\root\Office16\EXCEL.EXE
    WindowStyle  : 1
    IconLocation : C:\Program Files (x86)\Microsoft
                Office\Root\VFS\Windows\Installer\{90160000-000F-0000-0000-0000000FF1CE}\xlicons.exe,0
    Hotkey       :
    Target       : EXCEL.EXE
    Arguments    :
    LinkPath     : C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Excel.lnk
#>

    [CmdletBinding(ConfirmImpact='None')]
    param(
        [string] $path
    )

    $obj = New-Object -ComObject WScript.Shell

    if ($null -eq $path) {
        $pathUser = [System.Environment]::GetFolderPath('StartMenu')
        $pathCommon = $obj.SpecialFolders.Item('AllUsersStartMenu')
        $path = Get-ChildItem -Path $pathUser, $pathCommon -Filter *.lnk -Recurse
    }
    if ($path -is [string]) {
        $path = Get-ChildItem -Path $path -Filter *.lnk
    }
    $path | ForEach-Object {
        $tmpfile = $_
        if ($tmpfile -is [string]) {
            $tmpfile = Get-ChildItem -Path $_ -Filter *.lnk
        }
        if ($tmpfile) {
            $link = $obj.CreateShortcut($_.FullName)

            $info = @{}
            $info.Hotkey = $link.Hotkey
            $info.TargetPath = $link.TargetPath
            $info.LinkPath = $link.FullName
            $info.Arguments = $link.Arguments
            $info.Target = try {Split-Path -Path $info.TargetPath -Leaf } catch { 'n/a'}
            $info.Link = try { Split-Path -Path $info.LinkPath -Leaf } catch { 'n/a'}
            $info.WindowStyle = $link.WindowStyle
            $info.IconLocation = $link.IconLocation

            New-Object -TypeName PSObject -Property $info
        }
    }
}
