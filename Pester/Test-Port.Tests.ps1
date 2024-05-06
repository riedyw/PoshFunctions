Describe "[Test-Port] Tests" {

    It "Number" {
        Test-Port | Should -Be 15
    }

    It "Boolean" {
        Test-Port | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Test-Port | Should -Be 'Hello'
    }

}

# todo update Pester tests
