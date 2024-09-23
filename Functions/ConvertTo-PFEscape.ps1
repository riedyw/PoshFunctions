function ConvertTo-PFEscape {
    <#
.SYNOPSIS
    Will return an escaped string given the original string, a string containing special characters that need to be escaped and the escape character itself.
.DESCRIPTION
    Will return an escaped string given the original string, a string containing special characters that need to be escaped and the escape character itself.
.PARAMETER String
    The original text that needs to be escaped. Mandatory
.PARAMETER SpecialChar
    A string containing all special characters that need to be escaped.
.PARAMETER EscapeChar
    The single character that is the escape character
.PARAMETER IncludeInput
    Optional switch that will display all given values and the escaped result
.EXAMPLE
    ConvertTo-PFEscape -String 'new\pass"word,123' -SpecialChar '''";,\' -EscapeChar '\'

    new\\pass\"word\,123
.EXAMPLE
    ConvertTo-PFEscape -String 'new\pass"word,123' -SpecialChar '''";,\' -EscapeChar '\' -IncludeInput

    OriginalString    SpecialChar EscapeChar EscapedString
    --------------    ----------- ---------- -------------
    new\pass"word,123 '";,\                \ new\\pass\"word\,123
#>

    [CmdletBinding()]
    param (
        [string] $String = 'new\pass"word,123',

        [string] $SpecialChar = '''";,\',

        [char] $EscapeChar = '\',

        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $CharArray = $SpecialChar.ToCharArray()
        $DictArray = [array] $EscapeChar
        $CharArray | ForEach-Object {
            if (-not $DictArray.Contains($_)) {
                $DictArray += $_
            }
        }
    }

    process {
        $DictArray |
        ForEach-Object -Begin { $ReturnVal = $String } -Process {
            $ReturnVal = $ReturnVal -replace ('\' + $_), ($EscapeChar + $_)
        }
        if ($IncludeInput) {
            New-Object -TypeName psobject -Property ([ordered] @{
                    OriginalString = $String
                    SpecialChar    = $SpecialChar
                    EscapeChar     = $EscapeChar
                    EscapedString  = $ReturnVal
                })
        } else {
            Write-Output -InputObject $ReturnVal
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
