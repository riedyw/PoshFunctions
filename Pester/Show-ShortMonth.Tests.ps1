Describe "[Show-ShortMonth] Tests" {

    It "Number" {
        Show-ShortMonth | Should -Be 15
    }

    It "Boolean" {
        Show-ShortMonth | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Show-ShortMonth | Should -Be 'Hello'
    }

}

# todo update Pester tests
