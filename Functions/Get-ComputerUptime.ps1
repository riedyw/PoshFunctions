function Get-ComputerUptime {
<#
.SYNOPSIS
    To mimic the Get-Uptime function found in PowerShell 6 or 7
.DESCRIPTION
    To mimic the Get-Uptime function found in PowerShell 6 or 7
.PARAMETER Since
    Switch to show last boot time, not the timespan since last boot
.EXAMPLE
    Get-ComputerUptime

    Days              : 0
    Hours             : 8
    Minutes           : 20
    Seconds           : 37
    Milliseconds      : 306
    Ticks             : 300373061593
    TotalDays         : 0.34765400647338
    TotalHours        : 8.34369615536111
    TotalMinutes      : 500.621769321667
    TotalSeconds      : 30037.3061593
    TotalMilliseconds : 30037306.1593
.EXAMPLE
    Get-ComputerUptime -Since

    Sunday, February 28, 2021 12:47:04 PM
.NOTES
    To mimic the Get-Uptime function found in PowerShell 6 or 7
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact='Low')]
    [OutputType('psobject')]
    Param(
        [switch] $Since
    )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        $LastBootUpTime = (Get-CimInstance -ClassName Win32_OperatingSystem).LastBootUpTime
        if ($Since) {
            Write-Output $LastBootUpTime
        } else {
            Write-Output ((Get-Date) - $LastBootUpTime)
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}

Set-Alias -Name Get-LastReboot -Value Get-ComputerUptime -Description 'Alias for Get-ComputerUptime'
