function Set-Capslock {
<#
.SYNOPSIS
    Sets the state of the CapsLock button.
.DESCRIPTION
    Sets the state of the CapsLock button. It first determines the state of the CapsLock and then acts accordingly.
.PARAMETER On
    A switch parameter to determine if you want the CapsLock on.
.PARAMETER Off
    A switch parameter to determine if you want the CapsLock off.
.EXAMPLE
    Set-CapsLock
    Will turn on the CapsLock
.EXAMPLE
    Set-CapsLock -Off
    Will turn off the CapsLock
.NOTES
    Inspiration: # Inspired by https://gallery.technet.microsoft.com/on-off-keyboad-lock-keys-6ba9885c
    Changes:     Created function to set on or off the CapsLock. Requires use of helper function Test-IsCapsLock
.LINK
    Wscript.Shell
#>

    [CmdletBinding(ConfirmImpact = 'Low', SupportsShouldProcess, DefaultParameterSetName = 'On')]
    [OutputType($null)]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter','')]
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
        $CurrentState = Test-IsCapsLock -Verbose:$false
        $ShouldMessage = "CapsLock currently [$($CurrentState.ToString().ToUpper())] and desired state is [$($On.ToString().ToUpper())]"
        If ($PSCmdlet.ShouldProcess($ShouldMessage)) {
            if ($CurrentState -eq $true) {
                Write-Verbose -Message 'Current state is ON'
                if ($PsCmdlet.ParameterSetName -eq 'Off') {
                    Write-Verbose -Message 'Setting state to OFF'
                    $wShell = New-Object -ComObject Wscript.Shell -ErrorAction Stop
                    $wShell.SendKeys('{CapsLock}')
                    Remove-Variable -Name wShell
                }
            } else {
                Write-Verbose -Message 'Current state is OFF'
                if ($PsCmdlet.ParameterSetName -eq 'On') {
                    Write-Verbose -Message 'Setting state to ON'
                    $wShell = New-Object -ComObject Wscript.Shell -ErrorAction Stop
                    $wShell.SendKeys('{CapsLock}')
                    Remove-Variable -Name wShell
                }
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

} #EndFunction Set-Capslock
