Describe "[Test-IsAdmin] Tests" {

    It "Number" {
        Test-IsAdmin | Should -Be 15
    }

    It "Boolean" {
        Test-IsAdmin | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Test-IsAdmin | Should -Be 'Hello'
    }

}

# todo update Pester tests
