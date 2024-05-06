Describe "[Test-IsScrollLock] Tests" {

    It "Number" {
        Test-IsScrollLock | Should -Be 15
    }

    It "Boolean" {
        Test-IsScrollLock | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Test-IsScrollLock | Should -Be 'Hello'
    }

}

# todo update Pester tests
