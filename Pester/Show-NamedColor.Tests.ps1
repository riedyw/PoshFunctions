Describe "[Show-NamedColor] Tests" {

    It "Number" {
        Show-NamedColor | Should -Be 15
    }

    It "Boolean" {
        Show-NamedColor | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Show-NamedColor | Should -Be 'Hello'
    }

}

# todo update Pester tests
