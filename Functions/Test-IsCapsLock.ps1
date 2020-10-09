Function Test-IsCapsLock {
<#
.SYNOPSIS
    Determines if the CapsLock key is on or not
.DESCRIPTION
    Determines if the CapsLock key is on or not
.EXAMPLE
    Test-IsCapsLock
.EXAMPLE
    Test-IsCapsLock -Verbose
.LINK
http://www.google.com
.LINK
System.Console
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact='None')]
    [OutputType('bool')]
    Param()
    #endregion Parameter

    Begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    process {
        write-verbose -Message 'Determining the state of [CapsLock]'
        [System.Console]::CapsLock
    }

    End {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }
}
