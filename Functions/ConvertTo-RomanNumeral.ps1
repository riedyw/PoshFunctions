function ConvertTo-RomanNumeral {
    <#
.SYNOPSIS
    Converts a number to a Roman numeral.
.DESCRIPTION
    Converts a number - in the range of 1 to 3,999 - to a Roman numeral.
.PARAMETER Number
    An integer in the range 1 to 3,999.
.PARAMETER IncludeInput
    Switch to include input values in the output
.INPUTS
    System.Int32[]
.OUTPUTS
    System.String
.EXAMPLE
    ConvertTo-RomanNumeral -Number 1999

    MCMXCIX
.EXAMPLE
    2002 | ConvertTo-RomanNumeral

    MMII
.EXAMPLE
    ConvertTo-RomanNumeral 1918,1945 -IncludeInput

    Number RomanNumeral
    ------ ------------
    1918 MCMXVIII
    1945 MCMXLV
#>

    [CmdletBinding()]
    [OutputType([string])]
    Param
    (
        [Parameter(Mandatory,
            HelpMessage = 'Enter an integer in the range 1 to 3,999',
            ValueFromPipeline,
            Position = 0)]
        [ValidateRange(1, 3999)]
        [int[]] $Number,

        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $DecimalToRoman = @{
            Thousands = '', 'M', 'MM', 'MMM'
            Hundreds  = '', 'C', 'CC', 'CCC', 'CD', 'D', 'DC', 'DCC', 'DCCC', 'CM'
            Tens      = '', 'X', 'XX', 'XXX', 'XL', 'L', 'LX', 'LXX', 'LXXX', 'XC'
            Ones      = '', 'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX'
        }

        $column = @{
            Thousands = 0
            Hundreds  = 1
            Tens      = 2
            Ones      = 3
        }
    }

    process {
        foreach ($curNumber in $Number) {
            [int[]] $digits = $curNumber.ToString().PadLeft(4, '0').ToCharArray() |
            ForEach-Object { [Char]::GetNumericValue($_) }
            $RomanNumeral = ''
            $RomanNumeral += $DecimalToRoman.Thousands[$digits[$column.Thousands]]
            $RomanNumeral += $DecimalToRoman.Hundreds[$digits[$column.Hundreds]]
            $RomanNumeral += $DecimalToRoman.Tens[$digits[$column.Tens]]
            $RomanNumeral += $DecimalToRoman.Ones[$digits[$column.Ones]]
            if ($IncludeInput) {
                New-Object -TypeName psobject -Property ([ordered] @{
                        Number       = $curNumber
                        RomanNumeral = $RomanNumeral
                    })
                # write-output 'blah'
            } else {
                $RomanNumeral
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
