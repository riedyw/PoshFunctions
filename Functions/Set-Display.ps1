function Set-Display {
<#
.SYNOPSIS
    Set-Display turns the display on or off via energy saver api
.DESCRIPTION
    Set-Display turns the display on or off via energy saver api
.EXAMPLE
    Set-Display -Off ; Start-Sleep -Seconds 5 ; Set-Display -On
.NOTES
    Inspired by
    # Turning off display http://community.idera.com/database-tools/powershell/powertips/b/tips/posts/turning-display-off-immediately
    # Turning on display  https://www.codeproject.com/Articles/11099/Turn-on-off-monitor
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact = 'Low', DefaultParameterSetName = 'On')]
    [OutputType($null)]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]

    param (
        [parameter(ParameterSetName = 'On')]
        [switch] $On,

        [parameter(ParameterSetName = 'Off')]
        [switch] $Off
    )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "ParameterSetName [$($PsCmdlet.ParameterSetName)]"
        If ($Verbose) {
            Start-Sleep -Seconds 3
        }
    }

    process {
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

        $version = Get-CimInstance -ClassName win32_operatingsystem -Verbose:$false
        if ($PsCmdlet.ParameterSetName -eq 'Off') {
            if ($version.version -match '^10') {
                Start-Process -FilePath (Join-Path -Path $env:windir -ChildPath 'System32\scrnsave.scr') -ArgumentList '/s'
            } else {
                $t = Add-Type -TypeDefinition $code -PassThru
                Start-Sleep -Seconds 1
                $null = $t::SendMessage(0xffff, 0x0112, 0xf170, 2)
            }
        } else {
            if ($version.version -match '^10') {
                if (Get-Process -Name scrnsave.scr -ErrorAction SilentlyContinue) {
                    $pidToStop = [array] (Get-Process -Name scrnsave.scr -ErrorAction SilentlyContinue).id
                    Stop-Process -Id $pidToStop[0] -Force
                }
            } else {
                $t = Add-Type -TypeDefinition $code -PassThru
                Start-Sleep -Seconds 1
                $null = $t::SendMessage(0xffff, 0x0112, 0xf170, -1)
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
