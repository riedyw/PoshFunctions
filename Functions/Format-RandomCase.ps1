function Format-RandomCase {
<#
.SYNOPSIS
    Formats a string character by character randomly into upper or lower case.
.DESCRIPTION
    Formats a string character by character randomly into upper or lower case.
.PARAMETER String
    A [string[]] that you want formatted randomly into upper or lower case
.EXAMPLE
    Format-RandomCase -String 'HELLO WORLD IT IS ME!'

    Example return
    HelLo worlD It is me!
.NOTES
    If you need to specify 10 or more of a particular type of dice use several entries of that dice type that add up to the value you want.

    You want to know results of rolling ten 6-sided dice

    Get-DiceRoll -Dice 2d6,8d6
.OUTPUTS
    [string[]]
#>


    [CmdletBinding()]
    param (
        [parameter(ValueFromPipeline)]
        [string[]] $String
    )

    begin {

    }

    process {
        foreach ($CurrentString in $String) {
            $tmp = [char[]] $CurrentString
            $tmp | ForEach-Object -Begin { $returnVal = '' } -Process {
                $random = 0,1 | Get-Random
                if ($random -eq 0) {
                    $returnVal += ([string] $_).ToLower()
                } else {
                    $returnVal += ([string] $_).ToUpper()
                }
            }
            Write-Output $returnVal
        }

    }

    end {

    }
}
