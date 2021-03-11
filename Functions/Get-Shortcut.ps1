function Get-Shortcut {
<#
.SYNOPSIS
    Get information about a Shortcut (.lnk file)
.DESCRIPTION
    Get information about a Shortcut (.lnk file)
.PARAMETER Path
    File
.EXAMPLE
    Get-Shortcut -Path 'C:\Portable\Test.lnk'

    Link         : Test.lnk
    TargetPath   : C:\Portable\PortableApps\Notepad++Portable\Notepad++Portable.exe
    WindowStyle  : 1
    IconLocation : ,0
    Hotkey       :
    Target       : Notepad++Portable.exe
    Arguments    :
    LinkPath     : C:\Portable\Test.lnk
#>

    [CmdletBinding(ConfirmImpact='None')]
    param(
        [string] $path
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $obj = New-Object -ComObject WScript.Shell
    }

    process {
        if (Test-Path -Path $Path) {
            $ResolveFile = Resolve-Path -Path $Path
            if ($ResolveFile.count -gt 1) {
                Write-Error -Message "ERROR: File specification [$File] resolves to more than 1 file."
            } else {
                Write-Verbose -Message "Using file [$ResolveFile] in section [$Section], getting comments"
                $ResolveFile = Get-Item -Path $ResolveFile
                if ($ResolveFile.Extension -eq '.lnk') {
                    $link = $obj.CreateShortcut($ResolveFile.FullName)

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
                } else {
                    Write-Error -Message 'Extension is not .lnk'
                }
            }
        } else {
            Write-Error -Message "ERROR: File [$Path] does not exist"
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
