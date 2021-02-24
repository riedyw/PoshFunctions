function Test-IsCapsLock {
<#
.SYNOPSIS
    Determines if the CapsLock key is on or not
.DESCRIPTION
    Determines if the CapsLock key is on or not
.EXAMPLE
    Test-IsCapsLock
.EXAMPLE
    Test-IsCapsLock -Verbose
.NOTES
    Inspiration: # Inspired by https://gallery.technet.microsoft.com/on-off-keyboad-lock-keys-6ba9885c
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact='None')]
    [OutputType('bool')]
    Param()
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        Write-Verbose -Message 'Determining the state of [CapsLock]'
        $ReturnVal = [System.Console]::CapsLock
        Write-Output -InputObject $ReturnVal
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
