Function Set-Numlock {
<#
.SYNOPSIS
    Sets the state of the NumLock button. If you pass $true to function it will turn on NumLock.
.DESCRIPTION
    Sets the state of the NumLock button. If you pass $true to function it will turn on NumLock. It first determines the state of the NumLock and then acts accordingly.
.PARAMETER On
    A switch parameter to determine if you want the NumLock on.
.PARAMETER Off
    A switch parameter to determine if you want the NumLock off.
.EXAMPLE
    Set-NumLock -On
    Will turn on the NumLock
.EXAMPLE
    Set-NumLock -Off
    Will turn off the NumLock
.NOTES
    Author:      Bill Riedy
    Inspiration: # Inspired by https://gallery.technet.microsoft.com/on-off-keyboad-lock-keys-6ba9885c
    Changes:     Created function to set on or off the NumLock. Requires use of helper function Test-IsNumLock
.LINK
    New-Object
.LINK
    Wscript.Shell
#>

    [CmdletBinding(ConfirmImpact='Low',SupportsShouldProcess,DefaultParameterSetName='On')]
    [OutputType($null)]
    Param(
        [parameter(ParameterSetName = 'On')]
        [switch] $On,

        [parameter(ParameterSetName = 'Off')]
        [switch] $Off
    )

    Begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
        Write-Verbose -Message "ParameterSetName [$($PsCmdlet.ParameterSetName)]"
    }

    Process {
        $CurrentState = Test-IsNumLock -Verbose:$false
        $ShouldMessage = "NumLock currently [$($CurrentState.ToString().ToUpper())] and desired On is [$($On.ToString().ToUpper())]"
        If ($PSCmdlet.ShouldProcess($ShouldMessage))
        {
            if ($CurrentState -eq $true) {
                write-verbose -Message 'Current state is ON'
                if ($PsCmdlet.ParameterSetName -eq 'Off') {
                    write-verbose -Message 'Setting state to OFF'
                    $wShell = New-Object -ComObject Wscript.Shell -ErrorAction Stop
                    $wShell.SendKeys('{NUMLOCK}')
                    remove-variable -name wShell
                }
            } else {
                write-verbose -Message 'Current state is OFF'
                if ($PsCmdlet.ParameterSetName -eq 'On') {
                    write-verbose -Message 'Setting state to ON'
                    $wShell = New-Object -ComObject Wscript.Shell -ErrorAction Stop
                    $wShell.SendKeys('{NUMLOCK}')
                    remove-variable -name wShell
                }
            }
        }
    }

    End {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

} #EndFunction Set-Numlock
