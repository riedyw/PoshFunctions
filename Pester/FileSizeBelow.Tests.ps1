Describe "[FileSizeBelow] Tests" {

    It "Number" {
        FileSizeBelow | Should -Be 15
    }

    It "Boolean" {
        FileSizeBelow | Should -BeTrue
    }

    It "Pipeline" {
        "data" | FileSizeBelow | Should -Be 'Hello'
    }

}

# todo update Pester tests
