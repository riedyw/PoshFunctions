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
    param()
    #endregion parameter

    ie4uinit.exe -show
}
