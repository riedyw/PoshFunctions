function Set-Scrolllock {
<#
.SYNOPSIS
    Sets the state of the ScrollLock button.
.DESCRIPTION
    Sets the state of the ScrollLock button. It first determines the state of the ScrollLock and then acts accordingly.
.PARAMETER On
    A switch parameter to determine if you want the ScrollLock on.
.PARAMETER Off
    A switch parameter to determine if you want the ScrollLock off.
.EXAMPLE
    Set-ScrollLock
    Will turn on the ScrollLock
.EXAMPLE
    Set-ScrollLock -Off
    Will turn off the ScrollLock
.NOTES
    Inspiration: # Inspired by https://gallery.technet.microsoft.com/on-off-keyboad-lock-keys-6ba9885c
    Changes:     Created function to set on or off the ScrollLock. Requires use of helper function Test-IsScrollLock
.LINK
    Wscript.Shell
#>

    [CmdletBinding(ConfirmImpact='Low',SupportsShouldProcess,DefaultParameterSetName='On')]
    [OutputType($null)]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter','')]
    Param(
        [parameter(ParameterSetName='On')]
        [switch] $On,

        [parameter(ParameterSetName='Off')]
        [switch] $Off
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "ParameterSetName [$($PsCmdlet.ParameterSetName)]"
    }

    process {
        $CurrentState = Test-IsScrollLock -Verbose:$false
        $ShouldMessage = "ScrollLock currently [$($CurrentState.ToString().ToUpper())] and desired state is [$($On.ToString().ToUpper())]"
        if ($PSCmdlet.ShouldProcess($ShouldMessage)) {
            if ($CurrentState -eq $true) {
                write-verbose -Message 'ScrollLock is currently ON'
                if ($PsCmdlet.ParameterSetName -eq 'Off') {
                    write-verbose -Message 'Setting ScrollLock to OFF'
                    $wShell = New-Object -ComObject wscript.shell -ErrorAction Stop
                    $wShell.SendKeys('{ScrollLock}')
                    remove-variable -name wShell
                }
            } else {
                write-verbose -Message 'ScrollLock is currently OFF'
                if ($PsCmdlet.ParameterSetName -eq 'On') {
                    Write-Verbose -Message 'Setting ScrollLock to ON'
                    $wShell = New-Object -ComObject wscript.shell -ErrorAction Stop
                    $wShell.SendKeys('{ScrollLock}')
                    Remove-Variable -Name wShell
                }
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

} #EndFunction Set-Scrolllock
