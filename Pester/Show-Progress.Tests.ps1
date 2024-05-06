Describe "[Show-Progress] Tests" {

    It "Number" {
        Show-Progress | Should -Be 15
    }

    It "Boolean" {
        Show-Progress | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Show-Progress | Should -Be 'Hello'
    }

}

# todo update Pester tests
