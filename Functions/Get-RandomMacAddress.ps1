function Get-RandomMacAddress {
<#
.SYNOPSIS
    Gets a random sequence of 12 hexadecimal digits

.DESCRIPTION
    Gets a random sequence of 12 hexadecimal digits

.EXAMPLE
    Get-RandomMacAddress

    # Would return a result like
    6eee1e05cb29
#>

    [CmdletBinding(ConfirmImpact='None')]
    param()

    ( 1..12 | foreach-object {'{0:x}' -f (get-random -Maximum 16)}) -join ''
}
