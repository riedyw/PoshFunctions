Describe "[Test-Network] Tests" {

    It "Number" {
        Test-Network | Should -Be 15
    }

    It "Boolean" {
        Test-Network | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Test-Network | Should -Be 'Hello'
    }

}

# todo update Pester tests
