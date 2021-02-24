function Test-IsScrollLock {
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
#>

    [CmdletBinding(ConfirmImpact='None')]
    [OutputType('bool')]
    Param()

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        write-verbose -Message 'Determining the state of [ScrollLock]'
        $ReturnVal = [System.Windows.Forms.Control]::IsKeyLocked('Scroll')
        Write-Output -InputObject $ReturnVal
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
