function Test-IsScrollLock {
<#
.SYNOPSIS
    Determines if the ScrollLock key is on or not
.DESCRIPTION
    Determines if the ScrollLock key is on or not
.EXAMPLE
    Test-IsScrollLock
.EXAMPLE
    Test-IsScrollLock -Verbose
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
