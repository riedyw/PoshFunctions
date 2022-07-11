function Get-DisplayBrightness {
<#
.SYNOPSIS
    To get the current brightness of the display
.DESCRIPTION
    To get the current brightness of the display
.PARAMETER Full
    Switch to display the full WMI path to the current value
.EXAMPLE
    Get-DisplayBrightness

    60
.EXAMPLE
    Get-DisplayBrightness -Full

    Namespace Class                CurrentBrightness
    --------- -----                -----------------
    root/WMI  WmiMonitorBrightness                60
.EXAMPLE
    Set-Display -Brightness 100
    Get-DisplayBrightness

    100
.NOTES
    Inspired by: https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/check-monitor-brightness
#>

    # todo - add Credential

    # bug fix error if not laptop monitor

    #region parameter
    [CmdletBinding()]
    [OutputType('int')]
    Param
    (
        [switch] $Full

    )
    #endregion parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        $Cim = Get-CimInstance -Namespace 'root/WMI' -Class 'WmiMonitorBrightness'
        if ($Full) {
            New-Object psobject -Prop ([ordered] @{
                Namespace = 'root/WMI'
                Class = 'WmiMonitorBrightness'
                CurrentBrightness = $Cim.CurrentBrightness
            })
        } else {
            write-output $Cim.CurrentBrightness
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
