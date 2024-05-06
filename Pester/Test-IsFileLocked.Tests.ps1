Describe "[Test-IsFileLocked] Tests" {

    It "Number" {
        Test-IsFileLocked | Should -Be 15
    }

    It "Boolean" {
        Test-IsFileLocked | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Test-IsFileLocked | Should -Be 'Hello'
    }

}

# todo update Pester tests
