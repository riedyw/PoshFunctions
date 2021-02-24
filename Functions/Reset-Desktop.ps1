function Reset-Desktop {
<#
.SYNOPSIS
    Forces a reset of the desktop
.DESCRIPTION
    Forces a reset of the desktop and does things like refresh icons
.EXAMPLE
    Reset-Desktop

    Would reset the desktop
#>

    #region parameter
    [CmdletBinding(ConfirmImpact='Medium')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions','')]
    param()
    #endregion parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        ie4uinit.exe -show
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
