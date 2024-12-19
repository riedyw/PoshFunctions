function Get-SpeakerVolume {
<#
.SYNOPSIS
    Gets the current speaker volume.
.DESCRIPTION
    Gets the current speaker volume.
.PARAMETER Volume
    An integer value from 0 to 100 that will set the volume level of the speaker.
.EXAMPLE
    Set-SpeakerVolume -Volume 80

    Will display nothing and set the speaker to 80%
.EXAMPLE
    Set-SpeakerVolume -Volume 97 -Verbose

    Will diplay the following while setting the speaker to 96%
    VERBOSE: You specified the speaker volume should be 97%
    VERBOSE: Rounding down to 96%
    VERBOSE: Turning volume down to 0%
    VERBOSE: Turning volume up to 96%
.NOTES
    Renamed function from Set-Speaker to Set-SpeakerVolume to be clearer as to the purpose. Set an alias for the
    function to 'Set-Speaker' for backward compatibility.

#>

    [CmdletBinding()]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    param()

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        [int] ([PFAudio]::Volume * 100)

    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
