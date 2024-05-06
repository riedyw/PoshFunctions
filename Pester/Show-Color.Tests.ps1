Describe "[Show-Color] Tests" {

    It "Number" {
        Show-Color | Should -Be 15
    }

    It "Boolean" {
        Show-Color | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Show-Color | Should -Be 'Hello'
    }

}

# todo update Pester tests
