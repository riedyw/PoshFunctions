Describe "[Set-Scrolllock] Tests" {

    It "Number" {
        Set-Scrolllock | Should -Be 15
    }

    It "Boolean" {
        Set-Scrolllock | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Set-Scrolllock | Should -Be 'Hello'
    }

}

# todo update Pester tests
