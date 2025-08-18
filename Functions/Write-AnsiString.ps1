function Write-AnsiString {
<#
.SYNOPSIS
    Mimics the functionality of Write-Host with -ForegroundColor, -BackgroundColor, and -NoNewLine parameter and
    converts it to a string with Ansi escape sequences to achieve the same colors
.DESCRIPTION
    Mimics the functionality of Write-Host with -ForegroundColor, -BackgroundColor, and -NoNewLine parameter and
    converts it to a string with Ansi escape sequences to achieve the same colors
.NOTES
    Inspired by my annoyance with my multi-statement colored prompt appearing as multiple lines in a transcript
    of my PowerShell session.
.EXAMPLE
    Write-AnsiString -ForegroundColor DarkBlue -BackgroundColor DarkYellow -Object 'Hello there'

    Woud return
    [34m[43mHello there[0m

    Which is the words 'Hello there' in DarkBlue on a DarkYellow background
#>

    [CmdletBinding()]
    [OutputType([string])]
    param (
        [Parameter(Position=0, Mandatory, ValueFromRemainingArguments)]
        [string] $Object,

        [switch] $NoNewline,

        [ConsoleColor] $ForegroundColor,

        [ConsoleColor] $BackgroundColor
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $ansiColors = @{
            Black        = 0
            DarkRed      = 1
            DarkGreen    = 2
            DarkYellow   = 3
            DarkBlue     = 4
            DarkMagenta  = 5
            DarkCyan     = 6
            Gray         = 7
            DarkGray     = 60
            Red          = 61
            Green        = 62
            Yellow       = 63
            Blue         = 64
            Magenta      = 65
            Cyan         = 66
            White        = 67
        }

        $esc = [char] 27
        $ansiStart = ""
        $ansiReset = "${esc}[0m"
    }

    process {
        if ($ForegroundColor) {
            $fgValue = $ansiColors[$ForegroundColor.ToString()]
            $ansiStart += "${esc}[$(30 + $fgValue)m"
        }

        if ($BackgroundColor) {
            $bgValue = $ansiColors[$BackgroundColor.ToString()]
            $ansiStart += "${esc}[$(40 + $bgValue)m"
        }

        $output = "$ansiStart$Object$ansiReset"

        if (-not $NoNewline) {
            $output += "`n"
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
        return $output
    }
}
