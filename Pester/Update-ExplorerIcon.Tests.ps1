Describe "[Update-ExplorerIcon] Tests" {

    It "Number" {
        Update-ExplorerIcon | Should -Be 15
    }

    It "Boolean" {
        Update-ExplorerIcon | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Update-ExplorerIcon | Should -Be 'Hello'
    }

}

# todo update Pester tests
