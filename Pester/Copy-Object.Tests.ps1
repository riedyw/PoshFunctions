Describe "[Copy-Object] Tests" {

    It "Number" {
        Copy-Object | Should -Be 15
    }

    It "Boolean" {
        Copy-Object | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Copy-Object | Should -Be 'Hello'
    }

}

# todo update Pester tests
