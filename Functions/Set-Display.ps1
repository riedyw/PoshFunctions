function Set-Display {
<#
.SYNOPSIS
    Set-Display turns the display on or off via energy saver api. Can also set display brightness
.DESCRIPTION
    Set-Display turns the display on or off via energy saver api. Can also set display brightness
.PARAMETER On
    Switch to turn the display on
.PARAMETER Off
    Switch to turn the display off
.PARAMETER Brightness
    [int] representing the brightness. Valid range 1-100
.EXAMPLE
    Set-Display -Off ; Start-Sleep -Seconds 5 ; Set-Display -On
.EXAMPLE
    Set-Display -Brightness 75
.NOTES
    Inspired by
    # Turning off display http://community.idera.com/database-tools/powershell/powertips/b/tips/posts/turning-display-off-immediately
    # Turning on display  https://www.codeproject.com/Articles/11099/Turn-on-off-monitor
    # Brightness https://winaero.com/change-screen-brightness-windows-10/
#>

    # todo - add Credential

    #region Parameter
    [CmdletBinding(ConfirmImpact = 'Low', DefaultParameterSetName = 'On')]
    [OutputType($null)]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingWMICmdlet', '')]

    param (
        [parameter(ParameterSetName = 'On')]
        [switch] $On,

        [parameter(ParameterSetName = 'Off')]
        [switch] $Off,

        [parameter(ParameterSetName = 'Brightness')]
        [validaterange(1,100)]
        [int] $Brightness
    )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "ParameterSetName [$($PsCmdlet.ParameterSetName)]"
        If ($Verbose) {
            Start-Sleep -Seconds 2
        }
        $code = @'
using System;
using System.Runtime.InteropServices;
public class PFAPI
{
  [DllImport("user32.dll")]
  public static extern
  int SendMessage(IntPtr hWnd, UInt32 Msg, IntPtr wParam, IntPtr lParam);
}
'@
    }

    process {
        $version = Get-CimInstance -ClassName win32_operatingsystem -Verbose:$false
        switch ($PsCmdlet.ParameterSetName) {
            'Off' {
                if ($version.version -match '^10') {
                    Start-Process -FilePath (Join-Path -Path $env:windir -ChildPath 'System32\scrnsave.scr') -ArgumentList '/s'
                } else {
                    $Display = Add-Type -TypeDefinition $code -PassThru
                    Start-Sleep -Seconds 1
                    $null = $Display::SendMessage(0xffff, 0x0112, 0xf170, 2)
                }
            }
            'On' {
                if ($version.version -match '^10') {
                    if (Get-Process -Name scrnsave.scr -ErrorAction SilentlyContinue) {
                        $pidToStop = [array] (Get-Process -Name scrnsave.scr -ErrorAction SilentlyContinue).id
                        Stop-Process -Id $pidToStop[0] -Force
                    }
                } else {
                    $Display = Add-Type -TypeDefinition $code -PassThru
                    Start-Sleep -Seconds 1
                    $null = $Display::SendMessage(0xffff, 0x0112, 0xf170, -1)
                }
            }
            'Brightness' {
                (Get-WmiObject -Namespace root/WMI -Class WmiMonitorBrightnessMethods).WmiSetBrightness(1,$Brightness)
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
