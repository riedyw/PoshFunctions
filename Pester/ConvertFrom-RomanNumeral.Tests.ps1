Describe "[ConvertFrom-RomanNumeral] Tests" {

    It "Number" {
        ConvertFrom-RomanNumeral | Should -Be 15
    }

    It "Boolean" {
        ConvertFrom-RomanNumeral | Should -BeTrue
    }

    It "Pipeline" {
        "data" | ConvertFrom-RomanNumeral | Should -Be 'Hello'
    }

}

# todo update Pester tests
