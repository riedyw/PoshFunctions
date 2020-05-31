Function Start-RecordSession {
<#
.SYNOPSIS
    Creates a transcript of current Powershell session
.DESCRIPTION
    Creates a transcript of current Powershell session
.NOTES
    Author:     Bill Riedy
#>
    # Inspired by post https://groups.google.com/forum/#!topic/microsoft.public.exchange.admin/0z7249mOuzA
    # create a uniqely named transcript file for this session. It will have format of:
    # PS-date-pid.LOG
    # where
    # date is in YYYYMMDD format
    # pid is the process id of the currently running powershell console.
    # creates it in the LOGS directory under persons userprofile directory.
    # sets global and environment variables so Stop-RecordSession can know the name of the transcript file

    [CmdletBinding(ConfirmImpact='Low')]
    Param ()

    Begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    Process {
        $logDate = Get-Date -Format 'yyyyMMdd'
        $logPath = $env:userprofile + '\logs'
        if (-Not (Test-Path -path $logPath)) {
            mkdir -Path $logPath
        }
        $logFile = $logPath + '\PS-' + $logDate + '-' + $PID + '.log'
        $global:PSLOG = "$logFile"
        $env:PSLOG = "$logfile"
        # $global:Transcript = "$logfile"
        if (-Not (Test-Path -path $logFile)) {
            New-Item -Path $logFile -ItemType File | Out-Null
        }
        Start-Transcript -Path "$logFile" -append -force | Out-Null

    }

    End {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

} #EndFunction Start-RecordSession
