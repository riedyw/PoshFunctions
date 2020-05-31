#source https://blogs.technet.microsoft.com/heyscriptingguy/2015/07/29/use-function-to-determine-elevation-of-powershell-console/
# inspired by above, made some minor modifications like proving more output, making it an advanced function.

Function Test-IsAdmin {
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
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact='None')]
    [outputtype('bool')]
    Param()
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    process {
        If ( -not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator'))
        {
            Write-Verbose -message "You do not have Administrator rights to run this script!`nPlease re-run this script as an Administrator!"
            Write-output -inputobject $False
        } Else {
            Write-Verbose -message 'You have Administrator rights.'
            Write-output -inputobject $True
        }
    }

    end {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }
} #EndFunction Test-IsAdmin
