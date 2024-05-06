Describe "[Set-Numlock] Tests" {

    It "Number" {
        Set-Numlock | Should -Be 15
    }

    It "Boolean" {
        Set-Numlock | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Set-Numlock | Should -Be 'Hello'
    }

}

# todo update Pester tests
