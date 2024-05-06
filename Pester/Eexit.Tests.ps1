Describe "[Eexit] Tests" {

    It "Number" {
        Eexit | Should -Be 15
    }

    It "Boolean" {
        Eexit | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Eexit | Should -Be 'Hello'
    }

}

# todo update Pester tests
