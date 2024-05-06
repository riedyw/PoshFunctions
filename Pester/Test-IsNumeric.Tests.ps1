Describe "[Test-IsNumeric] Tests" {

    It "Number" {
        Test-IsNumeric | Should -Be 15
    }

    It "Boolean" {
        Test-IsNumeric | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Test-IsNumeric | Should -Be 'Hello'
    }

}

# todo update Pester tests
