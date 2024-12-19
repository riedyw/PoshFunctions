function Test-IsSpeakerMute {
<#
.SYNOPSIS
    Determines the state of the speaker being mute
.DESCRIPTION
    Determines the state of the speaker being mute
.EXAMPLE
    Test-IsSpeakerMute
.EXAMPLE
    Test-IsSpeakerMute -Verbose
.OUTPUTS
    bool
.NOTES
    Inspired by https://stackoverflow.com/questions/255419/how-can-i-mute-unmute-my-sound-from-powershell
#>

    [CmdletBinding(ConfirmImpact='None')]
    [OutputType('bool')]
    Param()

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        Write-Verbose -Message 'Determining the state of [SpeakerMute]'
        $ReturnVal = [PFAudio]::Mute
        Write-Output -InputObject $ReturnVal
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
