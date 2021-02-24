function Lock-Workstation {
<#
.SYNOPSIS
    Locks the workstation
.DESCRIPTION
    Locks the workstation and requires authentication afterwards
.EXAMPLE
    Lock-Workstation

    Would lock the workstation
#>

    #region parameter
    [CmdletBinding(ConfirmImpact='Medium')]
    param()
    #endregion parameter

    rundll32.exe user32.dll,LockWorkStation
}
