Describe "[Test-IsNull] Tests" {

    It "Number" {
        Test-IsNull | Should -Be 15
    }

    It "Boolean" {
        Test-IsNull | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Test-IsNull | Should -Be 'Hello'
    }

}

# todo update Pester tests
