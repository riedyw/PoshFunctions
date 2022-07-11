Describe "[Test-PasswordComplexity] Tests" {

    It "Number" {
        Test-PasswordComplexity | Should -Be 15
    }

    It "Boolean" {
        Test-PasswordComplexity | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Test-PasswordComplexity | Should -Be 'Hello'
    }

}

# todo update Pester tests
