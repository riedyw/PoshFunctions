Describe "[Test-IsNumLock] Tests" {

    It "Number" {
        Test-IsNumLock | Should -Be 15
    }

    It "Boolean" {
        Test-IsNumLock | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Test-IsNumLock | Should -Be 'Hello'
    }

}

# todo update Pester tests
