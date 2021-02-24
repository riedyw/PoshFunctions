function Eexit {
<#
.SYNOPSIS
    Closes the transcript, and exits the PowerShell session
.DESCRIPTION
    Closes the transcript, and exits the PowerShell session
#>

    # comment
    [CmdletBinding(ConfirmImpact='None')]
    Param()

    Write-Verbose -Message "Stopping transcript [$pslog] and exiting"
    Stop-RecordSession
    Exit
}
