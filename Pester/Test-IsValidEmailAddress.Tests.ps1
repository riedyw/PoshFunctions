Describe "[Test-IsValidEmailAddress] Tests" {

    It "Number" {
        Test-IsValidEmailAddress | Should -Be 15
    }

    It "Boolean" {
        Test-IsValidEmailAddress | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Test-IsValidEmailAddress | Should -Be 'Hello'
    }

}

# todo update Pester tests
