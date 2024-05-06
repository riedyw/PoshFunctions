Describe "[Show-Month] Tests" {

    It "Number" {
        Show-Month | Should -Be 15
    }

    It "Boolean" {
        Show-Month | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Show-Month | Should -Be 'Hello'
    }

}

# todo update Pester tests
