function Get-RandomHexDigit {
<#
.SYNOPSIS
    Gets a random hex digit, or a string of hex digits
.DESCRIPTION
    Gets a random hex digit, or a string of hex digits
.EXAMPLE
    Get-RandomHexDigit -Length 4

    f293
.EXAMPLE
    Get-RandomHexDigit -Length 2 -IncludePrefix

    0x2d
.EXAMPLE
    Get-RandomHexDigit -Length 6 -UpperCase

    92C08A
#>

    [CmdletBinding(ConfirmImpact='None')]
    param
    (
        [Parameter(Position=0)]
        [ValidateRange(1,16)]
        [int16] $Length = 1,

        [switch] $IncludePrefix,

        [switch] $UpperCase
    )

    $ReturnVal = ( 1..$Length | foreach-object {'{0:x}' -f (get-random -max 16)}) -join ''
    if ($UpperCase) {
        $ReturnVal = $ReturnVal.ToUpper()
    }
    if ($IncludePrefix) {
        $ReturnVal = '0x' + $ReturnVal
    }
    $ReturnVal
}
