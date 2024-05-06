Describe "[Merge-Object] Tests" {

    It "Number" {
        Merge-Object | Should -Be 15
    }

    It "Boolean" {
        Merge-Object | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Merge-Object | Should -Be 'Hello'
    }

}

# todo update Pester tests
