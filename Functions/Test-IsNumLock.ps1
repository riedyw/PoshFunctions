function Test-IsNumLock {
<#
.SYNOPSIS
    Determines the state of NumLock
.DESCRIPTION
    Determines the state of the NumLock. Optional -Verbose argument
.EXAMPLE
    Test-IsNumLock
.EXAMPLE
    Test-IsNumLock -Verbose
.OUTPUTS
    bool
.NOTES
    Inspiration: # Inspired by https://gallery.technet.microsoft.com/on-off-keyboad-lock-keys-6ba9885c
#>

    [CmdletBinding(ConfirmImpact='None')]
    [OutputType('bool')]
    Param()

    Begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        write-verbose -Message 'Determining the state of [NumLock]'
        $ReturnVal = [console]::NumberLock
        Write-Output -InputObject $ReturnVal
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
