Describe "[Test-IsValidIPv4] Tests" {

    It "Number" {
        Test-IsValidIPv4 | Should -Be 15
    }

    It "Boolean" {
        Test-IsValidIPv4 | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Test-IsValidIPv4 | Should -Be 'Hello'
    }

}

# todo update Pester tests
