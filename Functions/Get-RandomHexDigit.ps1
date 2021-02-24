function Get-RandomHexDigit {
<#
.SYNOPSIS
    Gets a random hex digit, or a string of hex digits
.DESCRIPTION
    Gets a random hex digit, or a string of hex digits
.PARAMETER Length
    Determines number of hexadecimal digits, defaults to 1
.PARAMETER IncludePrefix
    Switch which will prepend the result with '0x'
.PARAMETER UpperCase
    Switch will make hexadecimal digits uppercase, otherwise they return as lowercase
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
        [int] $Length = 1,

        [switch] $IncludePrefix,

        [switch] $UpperCase
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        $ReturnVal = ( 1..$Length | foreach-object {'{0:x}' -f (Get-Random -Maximum 16)}) -join ''
        if ($UpperCase) {
            $ReturnVal = $ReturnVal.ToUpper()
        }
        if ($IncludePrefix) {
            $ReturnVal = '0x' + $ReturnVal
        }
        Write-Output -InputObject $ReturnVal
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
