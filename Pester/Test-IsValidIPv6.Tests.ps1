Describe "[Test-IsValidIPv6] Tests" {

    It "Number" {
        Test-IsValidIPv6 | Should -Be 15
    }

    It "Boolean" {
        Test-IsValidIPv6 | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Test-IsValidIPv6 | Should -Be 'Hello'
    }

}

# todo update Pester tests
