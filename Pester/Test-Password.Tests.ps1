Describe "[Test-Password] Tests" {

    It "Number" {
        Test-Password | Should -Be 15
    }

    It "Boolean" {
        Test-Password | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Test-Password | Should -Be 'Hello'
    }

}

# todo update Pester tests
