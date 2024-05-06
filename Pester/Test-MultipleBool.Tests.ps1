Describe "[Test-MultipleBool] Tests" {

    It "Number" {
        Test-MultipleBool | Should -Be 15
    }

    It "Boolean" {
        Test-MultipleBool | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Test-MultipleBool | Should -Be 'Hello'
    }

}

# todo update Pester tests
