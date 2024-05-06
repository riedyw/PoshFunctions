Describe "[Show-Object] Tests" {

    It "Number" {
        Show-Object | Should -Be 15
    }

    It "Boolean" {
        Show-Object | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Show-Object | Should -Be 'Hello'
    }

}

# todo update Pester tests
