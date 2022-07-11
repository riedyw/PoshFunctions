Describe "[Expand-String] Tests" {

    It "Number" {
        Expand-String | Should -Be 15
    }

    It "Boolean" {
        Expand-String | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Expand-String | Should -Be 'Hello'
    }

}

# todo update Pester tests
