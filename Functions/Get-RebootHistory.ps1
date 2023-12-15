Function Get-RebootHistory {
<#
.SYNOPSIS
    This will output who initiated a reboot or shutdown event.
.DESCRIPTION
    This will output who initiated a reboot or shutdown event.
.NOTES
    Name: Get-RebootHistory
    Author: theSysadminChannel
    Version: 1.0
    DateCreated: 2020-Aug-5
    Source: https://thesysadminchannel.com/get-reboot-history-using-powershell/

    Added  @{PSTypeName   = 'PFGetRebootHistory'; ComputerName = $Computer; LogName = 'System'; EventId} to object returned
.LINK
    https://thesysadminchannel.com/get-reboot-history-using-powershell
.EXAMPLE
    Get-RebootHistory -ComputerName Server01, Server02
.EXAMPLE
    Get-RebootHistory -DaysFromToday 30 -MaxEvents 1
.PARAMETER ComputerName
    Specify a computer name you would like to check.  Default: $env:COMPUTERNAME
.PARAMETER DaysFromToday
    Specify the amount of days in the past you would like to search for. Default: 90
.PARAMETER MaxEvents
    Specify the number of events you would like to search for (from newest to oldest). Default 9999
#>

    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string[]]  $ComputerName = $env:COMPUTERNAME,

        [int]       $DaysFromToday = 90,

        [int]       $MaxEvents = 9999
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($Computer in $ComputerName) {
            try {
                $Computer = $Computer.ToUpper()
                $EventList = Get-WinEvent -ComputerName $Computer -FilterHashtable @{
                    LogName   = 'System'
                    Id        = '1074', '6008'
                    StartTime = (Get-Date).AddDays(-$DaysFromToday)
                } -MaxEvents $MaxEvents -ErrorAction Stop

                foreach ($Event in $EventList) {
                    if ($Event.Id -eq 1074) {
                        [PSCustomObject]@{
                            PSTypeName   = 'PFGetRebootHistory'
                            ComputerName = $Computer
                            LogName      = 'System'
                            EventId      = 1074
                            TimeStamp    = $Event.TimeCreated
                            UserName     = $Event.Properties.value[6]
                            ShutdownType = $Event.Properties.value[4]
                        }
                    }

                    if ($Event.Id -eq 6008) {
                        [PSCustomObject]@{
                            PSTypeName   = 'PFGetRebootHistory'
                            ComputerName = $Computer
                            LogName      = 'System'
                            EventId      = 6008
                            TimeStamp    = $Event.TimeCreated
                            UserName     = $null
                            ShutdownType = 'unexpected shutdown'
                        }
                    }

                }

            } catch {
                Write-Error $_.Exception.Message
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
