Function Stop-RecordSession {
<#
.SYNOPSIS
    Stops the running transcript
.DESCRIPTION
    Stops the running transcript
#>

    [CmdletBinding(ConfirmImpact = 'Medium')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidGlobalVars', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    param ()

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        Stop-Transcript
        $LogFile = $global:PSLOG
        $LogFile_Ascii = $LogFile + '-Ascii'
        'Stop-RecordSession : Running custom Stop-RecordSession function to Stop-Transcript and convert it to Ascii' | Out-File -FilePath $LogFile -Append -Encoding Ascii
        'Stop-RecordSession : Any further commands not recorded' | Out-File -FilePath $LogFile -Append -Encoding Ascii
        $(Get-Content -Path $LogFile) -replace "`0", '' | Out-File -FilePath $LogFile_Ascii -Encoding Ascii
        Remove-Item -Path $LogFile
        Rename-Item -Path $LogFile_Ascii -NewName $LogFile
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
