Describe "[Move-ToRecycleBin] Tests" {

    It "Number" {
        Move-ToRecycleBin | Should -Be 15
    }

    It "Boolean" {
        Move-ToRecycleBin | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Move-ToRecycleBin | Should -Be 'Hello'
    }

}

# todo update Pester tests
