Describe "[Show-ColorsWithBackground] Tests" {

    It "Number" {
        Show-ColorsWithBackground | Should -Be 15
    }

    It "Boolean" {
        Show-ColorsWithBackground | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Show-ColorsWithBackground | Should -Be 'Hello'
    }

}

# todo update Pester tests
