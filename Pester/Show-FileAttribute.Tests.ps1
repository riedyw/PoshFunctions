Describe "[Show-FileAttribute] Tests" {

    It "Number" {
        Show-FileAttribute | Should -Be 15
    }

    It "Boolean" {
        Show-FileAttribute | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Show-FileAttribute | Should -Be 'Hello'
    }

}

# todo update Pester tests
