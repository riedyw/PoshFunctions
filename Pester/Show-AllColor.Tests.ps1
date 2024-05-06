Describe "[Show-AllColor] Tests" {

    It "Number" {
        Show-AllColor | Should -Be 15
    }

    It "Boolean" {
        Show-AllColor | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Show-AllColor | Should -Be 'Hello'
    }

}

# todo update Pester tests
