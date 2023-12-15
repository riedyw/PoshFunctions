function Invoke-Beep {
<#
.SYNOPSIS
    Uses the Beep function of the .Net [Console] class
.DESCRIPTION
    Uses the Beep function of the .Net [Console] class. Alias as 'Beep'. Has the
    ability to play a number of different pre-defined set of tones.
.PARAMETER Frequency
    The frequency, in mHz, of the tone that you want to play. Defaults to 800.
    Minimum 37 Hz, maximum 32,767 Hz.
.PARAMETER Duration
    The duration, in milliseconds, that you wish to play the tone. Defaults to 200.
    Minimum 61 ms, maximum 3000 ms (3 seconds).
.PARAMETER Nasa
    A switch to play the NASA beep circa Apollo.
.PARAMETER StarWars
    A switch to play the Imperial March from Star Wars.
.PARAMETER Impossible
    A switch to play the Mission Impossible theme.
.PARAMETER Mario
    A switch to play the theme from Super Mario.
.PARAMETER Censor
    A switch to play the censor beep.
.PARAMETER Birthday
    A switch to play Happy Birthday.
.EXAMPLE
    Invoke-Beep
.EXAMPLE
    Invoke-Beep -Frequency 400 -Duration 500
.EXAMPLE
    Invoke-Beep -Impossible
#>

    [CmdletBinding(DefaultParameterSetName = 'Default')]
    [Alias('Beep')] #FunctionAlias
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter','')]
    param(
        [Parameter(ParameterSetName = 'Default')]
        [ValidateRange(37, 32767)]
        [int] $Frequency = 800,

        [Parameter(ParameterSetName = 'Default')]
        [ValidateRange(61, 3000)]
        [int] $Duration = 200,

        [Parameter(ParameterSetName = 'Nasa')]
        [switch] $Nasa,

        [Parameter(ParameterSetName = 'StarWars')]
        [switch] $StarWars,

        [Parameter(ParameterSetName = 'Impossible')]
        [switch] $Impossible,

        [Parameter(ParameterSetName = 'Mario')]
        [switch] $Mario,

        [Parameter(ParameterSetName = 'Censor')]
        [switch] $Censor,

        [Parameter(ParameterSetName = 'Birthday')]
        [switch] $Birthday

    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.MyCommand)]"
    }

    process {
        switch ($PsCmdlet.ParameterSetName) {
            'Default' {
                [system.console]::Beep($Frequency, $Duration)
            }
            'Nasa' {
                [system.console]::Beep(2475, 500)
            }
            'StarWars' {
                [system.console]::Beep(440, 500)
                Start-Sleep -Milliseconds 250
                [system.console]::Beep(440, 500)
                Start-Sleep -Milliseconds 250
                [system.console]::Beep(440, 500)
                Start-Sleep -Milliseconds 250
                [system.console]::Beep(349, 350)
                Start-Sleep -Milliseconds 175
                [system.console]::Beep(523, 150)
                Start-Sleep -Milliseconds 75
                [system.console]::Beep(440, 500)
                Start-Sleep -Milliseconds 250
                [system.console]::Beep(349, 350)
                Start-Sleep -Milliseconds 175
                [system.console]::Beep(523, 150)
                Start-Sleep -Milliseconds 75
                [system.console]::Beep(440, 1000)
                Start-Sleep -Milliseconds 500
                [system.console]::Beep(659, 500)
                Start-Sleep -Milliseconds 250
                [system.console]::Beep(659, 500)
                Start-Sleep -Milliseconds 250
                [system.console]::Beep(659, 500)
                Start-Sleep -Milliseconds 250
                [system.console]::Beep(698, 350)
                Start-Sleep -Milliseconds 175
                [system.console]::Beep(523, 150)
                Start-Sleep -Milliseconds 75
                [system.console]::Beep(415, 500)
                Start-Sleep -Milliseconds 250
                [system.console]::Beep(349, 350)
                Start-Sleep -Milliseconds 175
                [system.console]::Beep(523, 150)
                Start-Sleep -Milliseconds 75
                [system.console]::Beep(440, 1000)
                Start-Sleep -Milliseconds 500
            }
            'Impossible' {
                [system.console]::Beep(784, 150)
                Start-Sleep -Milliseconds 300
                [system.console]::Beep(784, 150)
                Start-Sleep -Milliseconds 300
                [system.console]::Beep(932, 150)
                Start-Sleep -Milliseconds 150
                [system.console]::Beep(1047, 150)
                Start-Sleep -Milliseconds 150
                [system.console]::Beep(784, 150)
                Start-Sleep -Milliseconds 300
                [system.console]::Beep(784, 150)
                Start-Sleep -Milliseconds 300
                [system.console]::Beep(699, 150)
                Start-Sleep -Milliseconds 150
                [system.console]::Beep(740, 150)
                Start-Sleep -Milliseconds 150
                [system.console]::Beep(784, 150)
                Start-Sleep -Milliseconds 300
                [system.console]::Beep(784, 150)
                Start-Sleep -Milliseconds 300
                [system.console]::Beep(932, 150)
                Start-Sleep -Milliseconds 150
                [system.console]::Beep(1047, 150)
                Start-Sleep -Milliseconds 150
                [system.console]::Beep(784, 150)
                Start-Sleep -Milliseconds 300
                [system.console]::Beep(784, 150)
                Start-Sleep -Milliseconds 300
                [system.console]::Beep(699, 150)
                Start-Sleep -Milliseconds 150
                [system.console]::Beep(740, 150)
                Start-Sleep -Milliseconds 150
                [system.console]::Beep(932, 150)
                [system.console]::Beep(784, 150)
                [system.console]::Beep(587, 1200)
                Start-Sleep -Milliseconds 75
                [system.console]::Beep(932, 150)
                [system.console]::Beep(784, 150)
                [system.console]::Beep(554, 1200)
                Start-Sleep -Milliseconds 75
                [system.console]::Beep(932, 150)
                [system.console]::Beep(784, 150)
                [system.console]::Beep(523, 1200)
                Start-Sleep -Milliseconds 150
                [system.console]::Beep(466, 150)
                [system.console]::Beep(523, 150)
            }
            'Mario' {
                [system.console]::Beep(659, 250) ##E
                [system.console]::Beep(659, 250) ##E
                [system.console]::Beep(659, 300) ##E
                [system.console]::Beep(523, 250) ##C
                [system.console]::Beep(659, 250) ##E
                [system.console]::Beep(784, 300) ##G
                [system.console]::Beep(392, 300) ##g
                [system.console]::Beep(523, 275) ## C
                [system.console]::Beep(392, 275) ##g
                [system.console]::Beep(330, 275) ##e
                [system.console]::Beep(440, 250) ##a
                [system.console]::Beep(494, 250) ##b
                [system.console]::Beep(466, 275) ##a#
                [system.console]::Beep(440, 275) ##a
                [system.console]::Beep(392, 275) ##g
                [system.console]::Beep(659, 250) ##E
                [system.console]::Beep(784, 250) ## G
                [system.console]::Beep(880, 275) ## A
                [system.console]::Beep(698, 275) ## F
                [system.console]::Beep(784, 225) ## G
                [system.console]::Beep(659, 250) ## E
                [system.console]::Beep(523, 250) ## C
                [system.console]::Beep(587, 225) ## D
                [system.console]::Beep(494, 225) ## B
            }
            'Censor' {
                [system.console]::Beep(987, 750)
            }
            'Birthday' {
                [System.Console]::Beep(262,200)
                [System.Console]::Beep(262,200)
                [System.Console]::Beep(294,200)
                [System.Console]::Beep(262,200)
                [System.Console]::Beep(349,200)
                [System.Console]::Beep(330,200)
                [System.Console]::Beep(262,200)
                [System.Console]::Beep(262,200)
                [System.Console]::Beep(294,200)
                [System.Console]::Beep(262,200)
                [System.Console]::Beep(392,200)
                [System.Console]::Beep(349,200)
                [System.Console]::Beep(262,200)
                [System.Console]::Beep(262,200)
                [System.Console]::Beep(482,200)
                [System.Console]::Beep(440,200)
                [System.Console]::Beep(349,200)
                [System.Console]::Beep(330,200)
                [System.Console]::Beep(294,200)
                [System.Console]::Beep(482,200)
                [System.Console]::Beep(482,200)
                [System.Console]::Beep(440,200)
                [System.Console]::Beep(349,200)
                [System.Console]::Beep(392,200)
                [System.Console]::Beep(349,200)
            }
        }


    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.MyCommand)]"
    }

}
