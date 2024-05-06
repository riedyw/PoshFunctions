Describe "[Test-IsCapsLock] Tests" {

    It "Number" {
        Test-IsCapsLock | Should -Be 15
    }

    It "Boolean" {
        Test-IsCapsLock | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Test-IsCapsLock | Should -Be 'Hello'
    }

}

# todo update Pester tests
