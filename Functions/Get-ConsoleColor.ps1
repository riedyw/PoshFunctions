function Get-ConsoleColor {
<#
.SYNOPSIS
    Get-ConsoleColor displays the names and values of the console colors
.DESCRIPTION
    Get-ConsoleColor displays the names and values of the console colors
.PARAMETER Show
    Shows the console colors with the current background color of the console
.PARAMETER ShowWithBackground
    Shows the console colors with each possible background color
.EXAMPLE
    Get-ConsoleColor

    Returns the following psobject

    Name        Dec Hex
    ----        --- ---
    Black         0 0x0
    DarkBlue      1 0x1
    DarkGreen     2 0x2
    DarkCyan      3 0x3
    DarkRed       4 0x4
    DarkMagenta   5 0x5
    DarkYellow    6 0x6
    Gray          7 0x7
    DarkGray      8 0x8
    Blue          9 0x9
    Green        10 0xA
    Cyan         11 0xB
    Red          12 0xC
    Magenta      13 0xD
    Yellow       14 0xE
    White        15 0xF
.EXAMPLE
    Get-ConsoleColor -Show

    Will perform Write-Host and the third color will have that text in that color

    Dec    ColorName Color
    === ============ ============
      0        Black Black
      1     DarkBlue DarkBlue
      2    DarkGreen DarkGreen
      3     DarkCyan DarkCyan
      4      DarkRed DarkRed
      5  DarkMagenta DarkMagenta
      6   DarkYellow DarkYellow
      7         Gray Gray
      8     DarkGray DarkGray
      9         Blue Blue
     10        Green Green
     11         Cyan Cyan
     12          Red Red
     13      Magenta Magenta
     14       Yellow Yellow
     15        White White
.EXAMPLE
Get-ConsoleColor -ShowWithBackground

Will perform Write-Hosts
- Where columns 1 & 2 are current background and foreground
- Where columns 3 onward have a background color of the color named in column 2
- Where columns 3 onward have a foreground color of the color in the current column

 0       Black Black DarkBlue DarkGreen DarkCyan DarkRed DarkMagenta DarkYellow Gray DarkGray Blue Green Cyan Red Magenta Yellow White
 1    DarkBlue Black DarkBlue DarkGreen DarkCyan DarkRed DarkMagenta DarkYellow Gray DarkGray Blue Green Cyan Red Magenta Yellow White
 2   DarkGreen Black DarkBlue DarkGreen DarkCyan DarkRed DarkMagenta DarkYellow Gray DarkGray Blue Green Cyan Red Magenta Yellow White
 3    DarkCyan Black DarkBlue DarkGreen DarkCyan DarkRed DarkMagenta DarkYellow Gray DarkGray Blue Green Cyan Red Magenta Yellow White
 4     DarkRed Black DarkBlue DarkGreen DarkCyan DarkRed DarkMagenta DarkYellow Gray DarkGray Blue Green Cyan Red Magenta Yellow White
 5 DarkMagenta Black DarkBlue DarkGreen DarkCyan DarkRed DarkMagenta DarkYellow Gray DarkGray Blue Green Cyan Red Magenta Yellow White
 6  DarkYellow Black DarkBlue DarkGreen DarkCyan DarkRed DarkMagenta DarkYellow Gray DarkGray Blue Green Cyan Red Magenta Yellow White
 7        Gray Black DarkBlue DarkGreen DarkCyan DarkRed DarkMagenta DarkYellow Gray DarkGray Blue Green Cyan Red Magenta Yellow White
 8    DarkGray Black DarkBlue DarkGreen DarkCyan DarkRed DarkMagenta DarkYellow Gray DarkGray Blue Green Cyan Red Magenta Yellow White
 9        Blue Black DarkBlue DarkGreen DarkCyan DarkRed DarkMagenta DarkYellow Gray DarkGray Blue Green Cyan Red Magenta Yellow White
10       Green Black DarkBlue DarkGreen DarkCyan DarkRed DarkMagenta DarkYellow Gray DarkGray Blue Green Cyan Red Magenta Yellow White
11        Cyan Black DarkBlue DarkGreen DarkCyan DarkRed DarkMagenta DarkYellow Gray DarkGray Blue Green Cyan Red Magenta Yellow White
12         Red Black DarkBlue DarkGreen DarkCyan DarkRed DarkMagenta DarkYellow Gray DarkGray Blue Green Cyan Red Magenta Yellow White
13     Magenta Black DarkBlue DarkGreen DarkCyan DarkRed DarkMagenta DarkYellow Gray DarkGray Blue Green Cyan Red Magenta Yellow White
14      Yellow Black DarkBlue DarkGreen DarkCyan DarkRed DarkMagenta DarkYellow Gray DarkGray Blue Green Cyan Red Magenta Yellow White
15       White Black DarkBlue DarkGreen DarkCyan DarkRed DarkMagenta DarkYellow Gray DarkGray Blue Green Cyan Red Magenta Yellow White
#>

    [CmdletBinding(ConfirmImpact='None')]
    [alias('Show-Color')] #FunctionAlias
    param (
        [switch] $Show,

        [switch] $ShowWithBackground
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $ConsoleColor = [Enum]::GetValues([ConsoleColor])
        $MaxName = ($ConsoleColor | ForEach-Object { "$_ ".Length } | Measure-Object -Maximum).Maximum
        if ($ShowWithBackground -and $PSBoundParameters.ContainsKey('ShowWithBackground')) {
            $Show = $false
            $Process = 'ShowWithBackground'
        } elseif ($Show -and $PSBoundParameters.ContainsKey('Show')) {
            $Process = 'Show'
        } else {
            $Process = 'Object'
        }
    }

    process {
        switch ($Process) {
            'Object' {
                $ConsoleColor |
                Select-Object -Property @{'Name' = 'Name'; 'Expression' = {$_.ToString()}},
                    @{'Name' = 'Dec'; 'Expression' = {[Int] $_}},
                    @{'Name' = 'Hex'; 'Expression' = {'0x{0:X1}' -f [Int] $_}}
            }

            'Show' {
                $ConsoleColor | ForEach-Object -Begin {
                    Write-Host ("{0,3} {1,$MaxName} {2,-$MaxName}" -f 'Dec', 'ColorName', 'Color'   )
                    Write-Host ("{0,3} {1,$MaxName} {2,-$MaxName}" -f '===', ('=' * $MaxName), ('=' * $MaxName) )
                } -Process {
                    Write-Host (" {0,2} {1,$MaxName} " -f [int] $_, $_) -NoNewline
                    Write-Host "$_" -ForegroundColor $_
                }
            }

            'ShowWithBackground' {
                $Colors = $ConsoleColor
                $BGColors = $ConsoleColor
                foreach ( $BGColor in $BGColors ) {
                    Write-Host ("{0,2}{1,$MaxName}" -f [int] $BGColor, $BGColor) -NoNewline
                    foreach ($color in $Colors) {
                        Write-Host (' {0}' -f ,$Color) -NoNewline -BackgroundColor $BGColor -ForegroundColor $Color
                        #if ($color -eq "Gray") { write-host " " ; write-host "  " -NoNewLine}
                    }
                    Write-Host ' '
                }
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

} # EndFunction Get-ConsoleColor
