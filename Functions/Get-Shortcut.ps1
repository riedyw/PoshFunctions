function Get-Shortcut {
<#
.SYNOPSIS
    Get information about a Shortcut (.lnk file)
.DESCRIPTION
    Get information about a Shortcut (.lnk file)
.PARAMETER Path
    Path to .lnk file
.EXAMPLE
    Get-Shortcut -path C:\portable\test2.lnk

    LinkPath     : C:\portable\test2.lnk
    Link         : test2.lnk
    TargetPath   : C:\Windows\System32\ncpa.cpl
    Target       : ncpa.cpl
    Arguments    :
    Hotkey       :
    WindowStyle  : Normal
    IconLocation : %SystemRoot%\system32\ncpa.cpl,0
    RunAsAdmin   : False
.NOTES
    Updates:
    * added code to determine RunAsAdmin status
    * added code to display WindowStyle as text as opposed to an integer

    Main function inspired by:
    https://stackoverflow.com/questions/484560/editing-shortcut-lnk-properties-with-powershell

    Checking for RunAsAdmin inspired by:
    https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/managing-shortcut-files-part-3
#>

    [CmdletBinding(ConfirmImpact='None')]
    param(
        [string] $Path
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $Obj = New-Object -ComObject WScript.Shell
    }

    process {
        if (Test-Path -Path $Path) {
            [array] $ResolveFile = Resolve-Path -Path $Path
            if ($ResolveFile.count -gt 1) {
                Write-Error -Message "ERROR: File specification [$File] resolves to more than 1 file."
            } else {
                Write-Verbose -Message "Using file [$ResolveFile] in section [$Section], getting comments"
                $ResolveFile = Get-Item -Path $ResolveFile
                if ($ResolveFile.Extension -eq '.lnk') {
                    $Link = $Obj.CreateShortcut($ResolveFile.FullName)

                    $Info = ([ordered] @{})
                    $Info.LinkPath = $Link.FullName
                    $Info.Link = try { Split-Path -Path $Info.LinkPath -Leaf } catch { 'n/a'}

                    $Info.TargetPath = $Link.TargetPath
                    $Info.Target = try {Split-Path -Path $Info.TargetPath -Leaf } catch { 'n/a'}
                    $Info.Arguments = $Link.Arguments
                    $Info.Hotkey = $Link.Hotkey
                    $Info.WindowStyle = $( switch($Link.WindowStyle) {
                        1 { 'Normal' }
                        3 { 'Maximized' }
                        7 { 'Minimized' }
                    })
                    $Info.IconLocation = $Link.IconLocation
                    $Info.RunAsAdmin = $(
                        $Bytes = [System.IO.File]::ReadAllBytes($ResolveFile)
                        if ($Bytes[0x15] -band 0x20) { $true } else { $false }
                    )
                    $Info.Description = $Link.Description
                    New-Object -TypeName PSObject -Property $Info
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
