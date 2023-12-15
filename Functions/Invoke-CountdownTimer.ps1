function Invoke-CountdownTimer {
<#
.SYNOPSIS
    Invokes a countdown timer
.DESCRIPTION
    Invokes a countdown timer where you specify the number of seconds, or the number of minutes. Can specify descriptive text
    that appears in the progress bar. Optionally can also beep when completed. Function aliased to 'CountdownTimer'
.PARAMETER Seconds
    An integer representing the number of seconds specified. Valid range 10-1800 seconds. Defaults to 30 if not specified
.PARAMETER Minutes
    An integer representing the number of minutes specified. Valid range 1-30 minutes
.PARAMETER Description
    A descriptive caption that appears in the progress bar. Defaults to 'Countdown timer'
.PARAMETER Notify
    Switch indicating that a call to Invoke-Beep should be made when the countdown timer is completed
.EXAMPLE
    Invoke-CountdownTimer  -Description 'My descriptive text' -Verbose -Minutes 1

    VERBOSE: Starting [Invoke-CountdownTimer]
    VERBOSE: ParameterSetName [Minutes]
    VERBOSE: Seconds [60], Minutes [1], Description [My descriptive text], Notify [False]
    VERBOSE: Ending [Invoke-CountdownTimer]

    Would display a progress bar counting down from 60 seconds
.EXAMPLE
    Invoke-CountdownTimer -Verbose

    VERBOSE: Starting [Invoke-CountdownTimer]
    VERBOSE: ParameterSetName [Seconds]
    VERBOSE: Seconds [10], Minutes [0], Description [Countdown timer], Notify [False]
    VERBOSE: Ending [Invoke-CountdownTimer]

    Would display a progress bar counting down from 10 seconds
.EXAMPLE
    Invoke-CountdownTimer -Notify

    Would display a progress bar counting down from 10 seconds and beep when finished
.NOTES
    This is not a precise countdown timer. The actual time elapsed may be several seconds more than what is specified

    Measure-Command { Invoke-CountdownTimer }

    Took 10.29 seconds

    Measure-Command { Invoke-CountdownTimer -Minutes 1 }

    Took 60.74 seconds
#>

    [CmdletBinding(DefaultParameterSetName = 'Seconds', ConfirmImpact = 'None')]
    [alias('CountdownTimer')] #FunctionAlias
    param (
        [Parameter(Position = 0, ParameterSetName = 'Seconds')]
        [ValidateRange(10, 1800)]
        [int] $Seconds = 30,

        [Parameter(ParameterSetName = 'Minutes')]
        [ValidateRange(1, 30)]
        [int] $Minutes,

        [Parameter(ParameterSetName = 'Seconds')]
        [Parameter(ParameterSetName = 'Minutes')]
        [string] $Description = 'Countdown timer',

        [Parameter(ParameterSetName = 'Seconds')]
        [Parameter(ParameterSetName = 'Minutes')]
        [switch] $Notify
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "ParameterSetName [$($PsCmdlet.ParameterSetName)]"
        if ($Minutes) {
            $Seconds = $Minutes * 60
        }
        Write-Verbose -Message "Seconds [$Seconds], Minutes [$Minutes], Description [$Description], Notify [$Notify]"
        $Description = $Description.Trim() + ', [Ctrl-C] to break.'
    }

    process {
        1..$Seconds | Show-Progress -Activity $Description  -PassThru -SecondsRemaining |
        ForEach-Object { Start-Sleep -Seconds 1 }
    }

    end {
        if ($Notify) {
            Invoke-Beep
        }
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
