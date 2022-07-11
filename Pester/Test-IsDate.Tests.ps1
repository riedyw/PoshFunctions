Describe "[Test-IsDate] Tests" {

    It "Number" {
        Test-IsDate | Should -Be 15
    }

    It "Boolean" {
        Test-IsDate | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Test-IsDate | Should -Be 'Hello'
    }

}

# todo update Pester tests
