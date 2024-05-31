Describe "[ConvertFrom-RomanNumeral] Tests" {

    It "Named" {
        ConvertFrom-RomanNumeral -Numeral i | Should -Be 1
        ConvertFrom-RomanNumeral -Numeral v | Should -Be 5
        ConvertFrom-RomanNumeral -Numeral x | Should -Be 10
        ConvertFrom-RomanNumeral -Numeral l | Should -Be 50
        ConvertFrom-RomanNumeral -Numeral c | Should -Be 100
        ConvertFrom-RomanNumeral -Numeral m | Should -Be 1000
        ConvertFrom-RomanNumeral -Numeral mmmcccxxxiii | Should -Be 3333
        ConvertFrom-RomanNumeral -Numeral mcmlxv | Should -Be 1965
    }

    It "Position" {
        ConvertFrom-RomanNumeral i | Should -Be 1
        ConvertFrom-RomanNumeral v | Should -Be 5
        ConvertFrom-RomanNumeral x | Should -Be 10
        ConvertFrom-RomanNumeral l | Should -Be 50
        ConvertFrom-RomanNumeral c | Should -Be 100
        ConvertFrom-RomanNumeral m | Should -Be 1000
        ConvertFrom-RomanNumeral mmmcccxxxiii | Should -Be 3333
        ConvertFrom-RomanNumeral mcmlxv | Should -Be 1965
    }

    It "Pipeline" {
        'i'            | ConvertFrom-RomanNumeral | Should -Be 1
        'v'            | ConvertFrom-RomanNumeral | Should -Be 5
        'x'            | ConvertFrom-RomanNumeral | Should -Be 10
        'l'            | ConvertFrom-RomanNumeral | Should -Be 50
        'c'            | ConvertFrom-RomanNumeral | Should -Be 100
        'm'            | ConvertFrom-RomanNumeral | Should -Be 1000
        'mmmcccxxxiii' | ConvertFrom-RomanNumeral | Should -Be 3333
        'mcmlxv'       | ConvertFrom-RomanNumeral | Should -Be 1965
    }

}
