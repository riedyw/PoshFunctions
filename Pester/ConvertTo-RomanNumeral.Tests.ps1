Describe "[ConvertTo-RomanNumeral] Tests" {

    It "Number" {
        ConvertTo-RomanNumeral -Number 1999 | Should -Be 'MCMXCIX'
    }

    It "Pipeline" {
        2002 | ConvertTo-RomanNumeral | Should -Be 'MMII'
    }

}
