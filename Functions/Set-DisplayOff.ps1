# Turning off display http://community.idera.com/database-tools/powershell/powertips/b/tips/posts/turning-display-off-immediately
# Turning on display  https://www.codeproject.com/Articles/11099/Turn-on-off-monitor

function Set-DisplayOff {
<#
.SYNOPSIS
    Set-DisplayOff turns the display off via energy saver api
.DESCRIPTION
    Set-DisplayOff turns the display off via energy saver api
.NOTES
    Author:     Bill Riedy
#>

    [cmdletbinding()]
    Param ()

    Begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    Process {
    $code = @'
using System;
using System.Runtime.InteropServices;
public class API
{
  [DllImport("user32.dll")]
  public static extern
  int SendMessage(IntPtr hWnd, UInt32 Msg, IntPtr wParam, IntPtr lParam);
}
'@

        $version = get-ciminstance -ClassName win32_operatingsystem

        if ($version.version -match '^10') {
            start-process -FilePath (join-path -Path $env:windir -ChildPath 'System32\scrnsave.scr') -ArgumentList '/s'
        }
        else {
            $t = Add-Type -TypeDefinition $code -PassThru
            start-sleep -seconds 1
            $null =  $t::SendMessage(0xffff, 0x0112, 0xf170, 2)
        }

    }

    End {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

}
