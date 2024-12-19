function Set-SpeakerVolume {
<#
.SYNOPSIS
    Sets the speaker volume.
.DESCRIPTION
    Sets the speaker volume.
.PARAMETER Volume
    An integer value from 0 to 100 that will set the volume level of the speaker.
.EXAMPLE
    Set-SpeakerVolume -Volume 80

    Will display nothing and set the speaker to 80%
.EXAMPLE
    Set-SpeakerVolume -Volume 60 -Verbose

    VERBOSE: Starting [Set-SpeakerVolume]
    VERBOSE: Setting speaker volume to [60]
    VERBOSE: Ending [Set-SpeakerVolume]
.NOTES
    Renamed function from Set-Speaker to Set-SpeakerVolume to be clearer as to the purpose. Set an alias for the
    function to 'Set-Speaker' for backward compatibility.

    Inspired by https://stackoverflow.com/questions/255419/how-can-i-mute-unmute-my-sound-from-powershell
#>

    [CmdletBinding(ConfirmImpact = 'Low')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [alias('Set-Speaker')] #FunctionAlias
    param(
        [Parameter(ValueFromPipeline, Position = 0)]
        [ValidateRange(0, 100)]
        [int] $Volume = 50
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        Write-Verbose -Message "Setting speaker volume to [$Volume]"
        [PFAudio]::Volume = [single] ($Volume / 100)
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
