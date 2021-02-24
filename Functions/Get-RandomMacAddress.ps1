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

    (1..12 | ForEach-Object {'{0:x}' -f (Get-Random -Maximum 16)}) -join ''
}
