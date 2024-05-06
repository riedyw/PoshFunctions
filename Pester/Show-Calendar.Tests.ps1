Describe "[Show-Calendar] Tests" {

    It "Number" {
        Show-Calendar | Should -Be 15
    }

    It "Boolean" {
        Show-Calendar | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Show-Calendar | Should -Be 'Hello'
    }

}

# todo update Pester tests
