Describe "[Join-Object] Tests" {

    It "Number" {
        Join-Object | Should -Be 15
    }

    It "Boolean" {
        Join-Object | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Join-Object | Should -Be 'Hello'
    }

}

# todo update Pester tests
