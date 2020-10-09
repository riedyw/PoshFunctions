Function Stop-RecordSession {
<#
.SYNOPSIS
    Stops the running transcript
.DESCRIPTION
    Stops the running transcript
#>

    [CmdletBinding(ConfirmImpact='Low')]
    [CmdletBinding()]
    param ()

    Stop-Transcript
    $logFile = $global:PSLOG
    $logFile_Ascii = $logFile + "-Ascii"
    "Stop-RecordSession : Running custom Stop-RecordSession function to Stop-Transcript and convert it to Ascii" | Out-File -FilePath $logFile -Append -Encoding Ascii
    "Stop-RecordSession : Any further commands not recorded" | Out-File -FilePath $logFile -Append -Encoding Ascii
    $(Get-Content -path $logFile) -replace "`0", "" | Out-File -FilePath $logFile_Ascii -Encoding Ascii
    Remove-Item -path $logFile
    Rename-Item -path $logFile_Ascii -newname $logFile
} #EndFunction Stop-RecordSession
