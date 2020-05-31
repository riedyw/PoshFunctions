function Set-WindowStyle {
<#
.SYNOPSIS
    To control the behavior of a window
.DESCRIPTION
    To control the behavior of a window
.PARAMETER Style
    Describe parameter -Style.

.PARAMETER MainWindowHandle
    Describe parameter -MainWindowHandle.

.EXAMPLE
    (Get-Process -Name notepad).MainWindowHandle | foreach { Set-WindowStyle MAXIMIZE $_ }
#>

    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter()]
        [ValidateSet('FORCEMINIMIZE', 'HIDE', 'MAXIMIZE', 'MINIMIZE', 'RESTORE',
                    'SHOW', 'SHOWDEFAULT', 'SHOWMAXIMIZED', 'SHOWMINIMIZED',
                    'SHOWMINNOACTIVE', 'SHOWNA', 'SHOWNOACTIVATE', 'SHOWNORMAL')]
        [string] $Style = 'SHOW',

        [Parameter()]
        $MainWindowHandle = (Get-Process -Id $pid).MainWindowHandle
    )

    Begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"

        $WindowStates = @{
            FORCEMINIMIZE   = 11; HIDE            = 0
            MAXIMIZE        = 3;  MINIMIZE        = 6
            RESTORE         = 9;  SHOW            = 5
            SHOWDEFAULT     = 10; SHOWMAXIMIZED   = 3
            SHOWMINIMIZED   = 2;  SHOWMINNOACTIVE = 7
            SHOWNA          = 8;  SHOWNOACTIVATE  = 4
            SHOWNORMAL      = 1
        }
    }

    Process {
        Write-Verbose -Message ('Set Window Style {1} on handle {0}' -f $MainWindowHandle, $($WindowStates[$style]))

        $Win32ShowWindowAsync = Add-Type -memberDefinition @'
[DllImport("user32.dll")]
public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);
'@ -name 'Win32ShowWindowAsync' -namespace Win32Functions -passThru

        $Win32ShowWindowAsync::ShowWindowAsync($MainWindowHandle, $WindowStates[$Style]) | Out-Null
    }

    End {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

}
