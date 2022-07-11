Describe "[ConvertTo-UncPath] Tests" {

    It "Number" {
        ConvertTo-UncPath | Should -Be 15
    }

    It "Boolean" {
        ConvertTo-UncPath | Should -BeTrue
    }

    It "Pipeline" {
        "data" | ConvertTo-UncPath | Should -Be 'Hello'
    }

}

# todo update Pester tests
