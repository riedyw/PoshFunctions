# Turning off display http://community.idera.com/database-tools/powershell/powertips/b/tips/posts/turning-display-off-immediately
# Turning on display  https://www.codeproject.com/Articles/11099/Turn-on-off-monitor

function Set-DisplayOn {
<#
.SYNOPSIS
    Turns the display on
.DESCRIPTION
    Turns the display on
.NOTES
    Inspiration:
    # Turning off display http://community.idera.com/database-tools/powershell/powertips/b/tips/posts/turning-display-off-immediately
    # Turning on display  https://www.codeproject.com/Articles/11099/Turn-on-off-monitor
    
    Made changes to encapsulate in one function
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
            if (get-process -Name scrnsave.scr -ErrorAction SilentlyContinue) {
                $pidToStop = [array] (get-process -Name scrnsave.scr -ErrorAction SilentlyContinue).id
                stop-process -ID $pidToStop[0] -Force
            }
        }
        else {
            $t = Add-Type -TypeDefinition $code -PassThru
            start-sleep -seconds 1
            $null =  $t::SendMessage(0xffff, 0x0112, 0xf170, -1)
        }
    }

    End {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }


}
