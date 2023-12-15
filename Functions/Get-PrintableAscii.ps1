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
.PARAMETER Class
    Single character U, L, N, S indicating you only want that class to be displayed. Optional.
.PARAMETER Similar
    Switch that will only display characters that are similar. Default is to print all. ParameterSetName = 'Similar'
.PARAMETER NotSimilar
    Switch that will only display characters that are not similar. Default is to print all. ParameterSetName = 'NotSimilar'
.EXAMPLE
    Get-PrintableAscii | Select-Object -First 10

    Would return:
    Ascii Hex Char    Class Similar
    ----- --- ----    ----- -------
       32 20  (Space) S       False
       33 21  !       S       False
       34 22  "       S       False
       35 23  #       S       False
       36 24  $       S       False
       37 25  %       S       False
       38 26  &       S       False
       39 27  '       S        True
       40 28  (       S       False
       41 29  )       S       False
.EXAMPLE
    Get-PrintableAscii -Class N

    Ascii Hex Char Class Similar
    ----- --- ---- ----- -------
       48 30     0 N        True
       49 31     1 N        True
       50 32     2 N       False
       51 33     3 N       False
       52 34     4 N       False
       53 35     5 N       False
       54 36     6 N       False
       55 37     7 N       False
       56 38     8 N       False
       57 39     9 N       False
#>

    [CmdletBinding(DefaultParameterSetName = 'Default')]
    param (
        [Parameter(ParameterSetName = 'Default')]
        [Parameter(ParameterSetName = 'Similar')]
        [Parameter(ParameterSetName = 'NotSimilar')]
        [ValidateSet('U', 'L', 'N', 'S')]
        [char] $Class,

        [Parameter(ParameterSetName = 'Similar')]
        [switch] $Similar,

        [Parameter(ParameterSetName = 'NotSimilar')]
        [switch] $NotSimilar
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        $PrintableAscii = 32..126 | ForEach-Object {
            [pscustomobject] @{
                PSTypeName = 'PFPrintableAscii'
                Ascii   = $_
                Hex     = ('{0:X2}' -f $_)
                Char    = ( [string] [char] [byte] $_)
                Class   = 'S'
                Similar = $false
            }
        }
        foreach ($char in $PrintableAscii) {
            switch -regex -casesensitive ($char.Char) {
                '[0-9]' { $char.Class = 'N' }
                '[A-Z]' { $char.Class = 'U' }
                '[a-z]' { $char.Class = 'L' }
                '[0|O|o|Q|1|l|I|\|+|t|\-|_|`|'']' { $char.Similar = $true }
                ' ' { $char.Char = '(Space)' }
            }
        }
        if ($Similar) {
            $PrintableAscii = $PrintableAscii | Where-Object { $_.Similar }
        } elseif ($NotSimilar) {
            $PrintableAscii = $PrintableAscii | Where-Object { -not $_.Similar }
        }
        if ($Class) {
            $PrintableAscii = $PrintableAscii | Where-Object { $_.Class -eq $Class }
        }
        Write-Output -InputObject $PrintableAscii
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
} # EndFunction Get-PrintableAscii
