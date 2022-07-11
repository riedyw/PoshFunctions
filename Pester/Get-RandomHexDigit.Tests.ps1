Describe "[Get-RandomHexDigit] Tests" {

    It "Number" {
        Get-RandomHexDigit | Should -Be 15
    }

    It "Boolean" {
        Get-RandomHexDigit | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-RandomHexDigit | Should -Be 'Hello'
    }

}

# todo update Pester tests
