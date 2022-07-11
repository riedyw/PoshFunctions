Describe "[Set-Capslock] Tests" {

    It "Number" {
        Set-Capslock | Should -Be 15
    }

    It "Boolean" {
        Set-Capslock | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Set-Capslock | Should -Be 'Hello'
    }

}

# todo update Pester tests
