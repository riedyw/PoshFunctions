function Start-RecordSession {
    <#
.SYNOPSIS
    Creates a transcript of current Powershell session
.DESCRIPTION
    Creates a transcript of current Powershell session
.NOTES
    # Inspired by post https://groups.google.com/forum/#!topic/microsoft.public.exchange.admin/0z7249mOuzA
    # create a uniqely named transcript file for this session. It will have format of:
    # PS-date-pid.LOG
    # where
    # date is in YYYYMMDD format
    # pid is the process id of the currently running powershell console.
    # creates it in the LOGS directory under persons userprofile directory.
    # sets global and environment variables so Stop-RecordSession can know the name of the transcript file
#>

    [CmdletBinding(ConfirmImpact = 'Medium')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidGlobalVars', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]

    Param ()

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        $logDate = Get-Date -Format 'yyyyMMdd'
        $LogPath = Join-Path -Path $env:userprofile -ChildPath '\logs'
        if (-not (Test-Path -Path $LogPath)) {
            mkdir -Path $LogPath
        }
        $Logfile = Join-Path -Path $LogPath -ChildPath ('\PS-' + $logDate + '-' + $PID + '.log')
        $global:PSLOG = "$Logfile"
        $env:PSLOG = "$Logfile"
        # $global:Transcript = "$Logfile"
        if (-not (Test-Path -Path $Logfile)) {
            $null = New-Item -Path $Logfile -ItemType File
        }
        $null = Start-Transcript -Path "$Logfile" -Append -Force
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
