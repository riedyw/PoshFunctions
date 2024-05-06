Describe "[Show-FsRight] Tests" {

    It "Number" {
        Show-FsRight | Should -Be 15
    }

    It "Boolean" {
        Show-FsRight | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Show-FsRight | Should -Be 'Hello'
    }

}

# todo update Pester tests
