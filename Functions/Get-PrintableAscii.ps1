function Get-PrintableAscii {
<#
.SYNOPSIS
    Gets an array of objects that show printable Ascii characters.
.DESCRIPTION
    Gets an array of objects that show printable Ascii characters. It shows the character code in decimal,
    in hex, the character itself, and the 'class' of character.

    U - Uppercase letters
    L - Lowercase letters
    N - Numbers
    S - Symbols (not U, L, or N)
    
    Will also mark characters that are similar to one another at first glance which you may want to avoid when generating a password.
.EXAMPLE
    Get-PrintableAscii | Select-Object -First 10
    
    Would return:
    Ascii Hex Char Class Similar
    ----- --- ---- ----- -------
       33 21     ! S       False
       34 22     " S       False
       35 23     # S       False
       36 24     $ S       False
       37 25     % S       False
       38 26     & S       False
       39 27     ' S       False
       40 28     ( S       False
       41 29     ) S       False
       42 2a     * S       False
       43 2b     + S        True
       44 2c     , S       False
       45 2d     - S       False
       46 2e     . S       False
       47 2f     / S       False
       48 30     0 N        True
       49 31     1 N        True
       50 32     2 N       False
       51 33     3 N       False
       52 34     4 N       False
#>

    [CmdletBinding()]
    param ()

    $PrintableAscii = 33..126 | ForEach-Object {
        [pscustomobject] @{
            Ascii   = $_;
            Hex     = ('{0:x2}' -f $_) ;
            Char    = ( [char] [byte] $_) ;
            Class   = 'S'
            Similar = $false
        }
    }

    foreach ($char in $PrintableAscii) {
        switch -regex -casesensitive ($char.Char) {
            '[0-9]' { $char.Class = 'N' }
            '[A-Z]' { $char.Class = 'U' }
            '[a-z]' { $char.Class = 'L' }
            '[0|O|o|1|l|I|\|+|t|-|_]' { $char.Similar = $true }
        }
    }

    Write-Output $PrintableAscii
}
