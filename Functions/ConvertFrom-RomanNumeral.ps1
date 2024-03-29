function ConvertFrom-RomanNumeral {
    <#
.SYNOPSIS
    Converts a roman numeral to a number.
.DESCRIPTION
    Converts a roman numeral - in the range of I..MMMCMXCIX - to a number.
.PARAMETER Numeral
    A roman numeral in the range I..MMMCMXCIX (1..3,999).
.PARAMETER IncludeInput
    Switch to include input values in the output
.INPUTS
    System.String[]
.OUTPUTS
    System.Int32
.NOTES
    Requires PowerShell version 3.0
.EXAMPLE
    ConvertFrom-RomanNumeral -Numeral MMXIV
.EXAMPLE
    "MMXIV" | ConvertFrom-RomanNumeral
#>

    [CmdletBinding()]
    [OutputType([int])]
    Param
    (
        [Parameter(Mandatory = $true,
            HelpMessage = 'Enter a roman numeral in the range I..MMMCMXCIX',
            ValueFromPipeline = $true,
            Position = 0)]
        [ValidatePattern('(?x)^
                         M{0,3}  # Thousands
                (CM|CD|D?C{0,3}) # Hundreds
                (XC|XL|L?X{0,3}) # Tens
                (IX|IV|V?I{0,3}) # Ones
                $')]
        [string[]] $Numeral,

        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        # This must be an [ordered] hashtable
        $RomanToDecimal = [ordered]@{
            M  = 1000
            CM = 900
            D  = 500
            CD = 400
            C  = 100
            XC = 90
            L  = 50
            X  = 10
            IX = 9
            V  = 5
            IV = 4
            I  = 1
        }
    }

    process {
        foreach ($curNum in $Numeral) {
            $roman = $curNum + '$'
            $value = 0

            do {
                foreach ($key in $RomanToDecimal.Keys) {
                    if ($key.Length -eq 1) {
                        if ($key -match $roman.Substring(0, 1)) {
                            $value += $RomanToDecimal.$key
                            $roman = $roman.Substring(1)
                            break
                        }
                    } else {
                        if ($key -match $roman.Substring(0, 2)) {
                            $value += $RomanToDecimal.$key
                            $roman = $roman.Substring(2)
                            break
                        }
                    }
                }
            }
            until ($roman -eq '$')
            if ($IncludeInput) {
                New-Object -TypeName psobject -Property ([ordered] @{
                        RomanNumeral = $curNum
                        Number       = $value
                    })
                # write-output 'blah'
            } else {
                $value
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
