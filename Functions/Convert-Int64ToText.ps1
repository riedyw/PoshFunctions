function Convert-Int64ToText {
# todo - need cmdlet help
    [cmdletbinding()]
    [alias('Convert-IntToText')]
    param (
        [int64] $Number,

        [switch] $IncludeInput
    )

    begin {
            Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    Write-Verbose -Message "Number [$Number] IncludeInput [$IncludeInput]"
        if (($Number -lt -999999999999) -or ($Number -gt 999999999999)) {
            write-error -Message '-Number too large or too small. The absolute value of the number must be less than or equal to 999,999,999,999'
            break
        }
$class = @'
public class PFNum2Word
    {
    public static string NumberToText( long n)
        {
        if ( n < 0 )
            return "Minus " + NumberToText(-n);
            else if ( n == 0 )
            return "";
        else if ( n <= 19 )
            return new string[] {"One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight",
            "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen",
            "Seventeen", "Eighteen", "Nineteen"}[n-1] + " ";
        else if ( n <= 99 )
            return new string[] {"Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy",
            "Eighty", "Ninety"}[n / 10 - 2] + " " + NumberToText(n % 10);
        else if ( n <= 199 )
            return "One Hundred " + NumberToText(n % 100);
        else if ( n <= 999 )
            return NumberToText(n / 100) + "Hundred " + NumberToText(n % 100);
        else if ( n <= 1999 )
            return "One Thousand " + NumberToText(n % 1000);
        else if ( n <= 999999 )
            return NumberToText(n / 1000) + "Thousand " + NumberToText(n % 1000);
        else if ( n <= 1999999 )
            return "One Million " + NumberToText(n % 1000000);
        else if ( n <= 999999999)
            return NumberToText(n / 1000000) + "Million " + NumberToText(n % 1000000);
        else if ( n <= 1999999999 )
            return "One Billion " + NumberToText(n % 1000000000);
        else if ( n <= 999999999999 )
            return NumberToText(n / 1000000000) + "Billion " + NumberToText(n % 1000000000);
        else
            return "";
    }
}
'@

Add-Type -TypeDefinition $class
    }

    process {
        $Result = ([PFNum2Word]::NumberToText($Number))
        if ($IncludeInput) {
            New-Object -TypeName pscustomobject -Property ([ordered] @{
                Number = $Number
                Result = $Result
            })
        } else {
            Write-Output -InputObject $Result
        }

    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}




