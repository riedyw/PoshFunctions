function Get-ComputerUptime {
<#
.SYNOPSIS
    To mimic and extend the Get-ComputerUptime function found in PowerShell 6 or 7
.DESCRIPTION
    To mimic and extend the Get-ComputerUptime function found in PowerShell 6 or 7
.PARAMETER Since
    Switch to show last boot time, not the timespan since last boot
.PARAMETER ComputerName
    String array of computers to check uptime against. If not given or is '.' it is replaced with $env:COMPUTERNAME
.PARAMETER IncludeComputerName
    Switch on whether to include the computer name in the output
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
.EXAMPLE
    Get-ComputerUptime -IncludeComputerName -Since

    ComputerName LastBoot
    ------------ --------
    DemoLaptop   3/16/2021 12:59:24 PM
.EXAMPLE
    Get-ComputerUptime -IncludeComputerName -Since -ComputerName server1, server2

    ComputerName LastBoot
    ------------ --------
    server1      3/18/2021 10:58:53 PM
    server2      3/17/2021 1:50:49 PM
.NOTES
    To mimic and extend the functionality of the Get-Uptime function found in PowerShell 6 or 7
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact = 'Low')]
    [OutputType('psobject')]
    Param(
        [switch] $Since,

        [string[]] $ComputerName,

        [switch] $IncludeComputerName
    )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        if ($ComputerName -eq '.' -or $ComputerName -eq '' -or $null -eq $ComputerName) {
            $ComputerName = $env:COMPUTERNAME
        }
    }

    process {
        foreach ($curComputerName in $ComputerName) {
            try {
                $LastBootUpTime = (Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName $curComputerName -ErrorAction Stop).LastBootUpTime
                if ($Since) {
                    if ($IncludeComputerName) {
                        New-Object -TypeName psobject -Property ([ordered] @{
                                ComputerName = $curComputerName
                                LastBoot     = $LastBootUpTime
                            })
                    } else {
                        Write-Output $LastBootUpTime
                    }
                } else {
                    $TimeSpan = ((Get-Date) - $LastBootUpTime)
                    if ($IncludeComputerName) {
                        $TimeSpan | Add-Member -MemberType NoteProperty -Name ComputerName -Value $curComputerName
                    }
                    Write-Output ($TimeSpan | Select-Object -Property *)
                }
            } catch {
                Write-Error -Message "Either computer [$curComputerName] is not up, or you don't have permission to read from WMI objects."
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}

Set-Alias -Name Get-LastReboot -Value Get-ComputerUptime -Description 'Alias for Get-ComputerUptime'
