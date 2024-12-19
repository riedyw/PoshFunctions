function Set-SpeakerMute {
<#
.SYNOPSIS
    Sets the state of the speaker being mute. If you pass $true to function it will turn on Mute.
.DESCRIPTION
    Sets the state of the speaker being mute. If you pass $true to function it will turn on Mute.
.PARAMETER On
    A switch parameter to determine if you want SpeakerMute on.
.PARAMETER Off
    A switch parameter to determine if you want SpeakerMute off.
.EXAMPLE
    Set-SpeakerMute -On
    Will turn on speaker mute
.EXAMPLE
    Set-SpeakerMute -Off
    Will turn off speaker mute
.NOTES
    Inspired by https://stackoverflow.com/questions/255419/how-can-i-mute-unmute-my-sound-from-powershell
#>

    [CmdletBinding(ConfirmImpact = 'Low', SupportsShouldProcess, DefaultParameterSetName = 'On')]
    [OutputType($null)]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter', '')]
    Param(
        [parameter(ParameterSetName = 'On')]
        [switch] $On,

        [parameter(ParameterSetName = 'Off')]
        [switch] $Off
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "ParameterSetName [$($PsCmdlet.ParameterSetName)]"
    }

    process {
        if ($On) {
            [PFAudio]::Mute = $true
        } else {
            [PFAudio]::Mute = $false
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

} #EndFunction Set-SpeakerMute
