function Test-IsAdmin {
<#
.SYNOPSIS
    Determines if you are running elevated (as Administrator)
.DESCRIPTION
    Determines if you are running elevated (as Administrator)
.EXAMPLE
    Test-IsAdmin

    Would return the following if the prompt was elevated.
    $True
.EXAMPLE
    Test-IsAdmin -Verbose

    Would return the following if the prompt was elevated.
    VERBOSE: You have Administrator rights.
    True
.NOTES
    #source https://blogs.technet.microsoft.com/heyscriptingguy/2015/07/29/use-function-to-determine-elevation-of-powershell-console/
    # inspired by above, made some minor modifications like proving more output, making it an advanced function.
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact = 'None')]
    [OutputType('bool')]
    Param()
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        if ( -not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
            Write-Verbose -Message 'You do NOT have Administrator rights.'
            Write-Output -InputObject $False
        } else {
            Write-Verbose -Message 'You have Administrator rights.'
            Write-Output -InputObject $True
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
