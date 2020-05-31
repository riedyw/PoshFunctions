Function Test-IsNumLock {
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
#>

    [CmdletBinding(ConfirmImpact='None')]
    [OutputType('bool')]
    Param()

    Begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    Process {
        write-verbose -Message 'Determining the state of [NumLock]'
        [console]::NumberLock
    }

    End {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }
}
