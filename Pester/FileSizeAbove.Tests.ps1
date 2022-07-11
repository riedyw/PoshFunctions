Describe "[FileSizeAbove] Tests" {

    It "Number" {
        FileSizeAbove | Should -Be 15
    }

    It "Boolean" {
        FileSizeAbove | Should -BeTrue
    }

    It "Pipeline" {
        "data" | FileSizeAbove | Should -Be 'Hello'
    }

}

# todo update Pester tests
