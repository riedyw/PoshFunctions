function Set-Speaker {
<#
.SYNOPSIS
    Sets the speaker volume.
.DESCRIPTION
    Sets the speaker volume.
.PARAMETER Volume
    An integer value from 0 to 100 that will set the volume level of the speaker.
.EXAMPLE
    Set-Speaker -Volume 80

    Will display nothing and set the speaker to 80%
.EXAMPLE
    Set-Speaker -Volume 97 -Verbose

    Will diplay the following while setting the speaker to 96%
    VERBOSE: You specified the speaker volume should be 97%
    VERBOSE: Rounding down to 96%
    VERBOSE: Turning volume down to 0%
    VERBOSE: Turning volume up to 96%
.NOTES
    The interface to setting the speaker volume really accepts values 0-50, and displays as 0-100.
    Given this oddity, the function will round DOWN to an even number. So if you run
    Set-Speaker -Volume 99
    The icon for the speaker will display 98% if you hover over it.
#>

    [CmdletBinding(ConfirmImpact = 'Low')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    Param(
        [Parameter(Mandatory, ValueFromPipeline, HelpMessage = 'Enter the speaker volume from 0-100')]
        [ValidateRange(0, 100)]
        [int] $Volume
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        Write-Verbose -Message "You specified the speaker volume should be $Volume%"
        if (($Volume % 2) -ne 0) {
            $Volume = $Volume - 1
            Write-Verbose -Message "Rounding down to $Volume%"
        }
        [int] $workingVolume = [math]::floor($Volume / 2)
        $wshShell = New-Object -ComObject wscript.shell
        Write-Verbose -Message 'Turning volume down to 0%'
        1..50 | ForEach-Object -Process { $wshShell.SendKeys([char]174) }
        if ($workingVolume -gt 0) {
            Write-Verbose -Message "Turning volume up to $Volume%"
            1..$workingVolume | ForEach-Object -Process { $wshShell.SendKeys([char]175) }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
