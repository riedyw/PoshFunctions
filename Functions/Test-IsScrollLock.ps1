# Inspired by https://gallery.technet.microsoft.com/on-off-keyboad-lock-keys-6ba9885c

Function Test-IsScrollLock {
<#
.SYNOPSIS
    Sets the state of the ScrollLock button. If you pass $true to function it will turn on ScrollLock.
.DESCRIPTION
    Sets the state of the ScrollLock button. If you pass $true to function it will turn on
    ScrollLock. It first determines the state of the ScrollLock and then acts accordingly.
.PARAMETER State
    A switch parameter to determine if you want the ScrollLock to be $true or $false.
.EXAMPLE
    Set-ScrollLock -State
    Will turn on the ScrollLock
.EXAMPLE
    Set-ScrollLock -State:$false
    Will turn off the ScrollLock
.INPUTS
    None
.OUTPUTS
    bool
.NOTES
    Inspiration: # Inspired by https://gallery.technet.microsoft.com/on-off-keyboad-lock-keys-6ba9885c
    Changes:     Created function to set on or off the ScrollLock. Requires use of helper function Test-IsScrollLock
#>

    [CmdletBinding(ConfirmImpact='None')]
    [OutputType('bool')]
    Param()

    Begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    Process {
        write-verbose -Message 'Determining the state of [ScrollLock]'
        [System.Windows.Forms.Control]::IsKeyLocked('Scroll')
    }

    End {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }
}
