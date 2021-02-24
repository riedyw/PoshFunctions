function Get-Round {
<#
.SYNOPSIS
    Correctly rounds a number. Optionally can specify the number of digits to round to.
.DESCRIPTION
    Correctly rounds a number. Optionally can specify the number of digits to round to. Default behavior for [math]::Round is to round [System.MidpointRounding]::ToEven so 2.5 would round to 2 as opposed to expected behavior of rounding to 3.

    Without this [math]::Round(0.25, 1) will round to 0.2 as opposed to what it should of 0.3.
.PARAMETER Number
    The number to round. Can be a single number, or an array of numbers. Positional parameter. Accepts pipeline input.
.PARAMETER Digit
    The number of digits after the decimal point. Defaults to 0.
.PARAMETER IncludeOriginal
    A switch to determine if you want the input parameters to be included in the output
.NOTES
    Inspired by: https://stackoverflow.com/questions/41700200/how-to-correctly-round-numbers-in-powershell
.EXAMPLE
    Get-Round 2.5

    Returns a properly rounded value of 3.
.EXAMPLE
    Get-Round 2.45 -Digit 1

    Returns a properly rounded value of 2.5.
.EXAMPLE
    Get-Round -Number 2.45 -Digit 1 -IncludeOriginal

    # Would return
    Original Digits Rounded
    -------- ------ -------
        2.45      1     2.5
.EXAMPLE
    2.45, 3.22, 7.26 | Get-Round -Digit 1 -IncludeOriginal

    # Would return
    Original Digits Rounded
    -------- ------ -------
        2.45      1     2.5
        3.22      1     3.2
        7.26      1     7.3
.OUTPUTS
    [double]
.LINK
    https://social.msdn.microsoft.com/Forums/vstudio/en-US/0221d962-26e6-4a7e-be7a-72cd669a0dfc/why-systemmathround0251-2?forum=vbgeneral

    Talks about Visual Basic but the same info applies to Powershell.
.NOTES
    # Inspired by: https://stackoverflow.com/questions/41700200/how-to-correctly-round-numbers-in-powershell
#>

    #region parameter
    [CmdletBinding(ConfirmImpact='Low')]
    [OutputType('double')]
    Param (
        [parameter(Mandatory,HelpMessage='Enter the number you wish to be rounded',Position=0,ValueFromPipeline)]
        [double[]] $Number,

        [parameter(Position=1)]
        [int] $Digit = 0,

        [switch] $IncludeOriginal
    )
    #endregion parameter

    begin {

    }

    process {
        foreach ($currentNumber in $Number) {
            $ReturnVal = [double] [math]::Round($currentNumber, $Digit, [System.MidpointRounding]::AwayFromZero)
            if ($IncludeOriginal) {
                New-Object -TypeName 'psobject' -Property ([ordered] @{
                    Original = $currentNumber
                    Digits = $Digit
                    Rounded = $ReturnVal
                })
            } else {
                Write-Output -InputObject $ReturnVal
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
