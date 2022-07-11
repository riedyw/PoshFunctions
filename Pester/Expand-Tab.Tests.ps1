Describe "[Expand-Tab] Tests" {

    It "Number" {
        Expand-Tab | Should -Be 15
    }

    It "Boolean" {
        Expand-Tab | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Expand-Tab | Should -Be 'Hello'
    }

}

# todo update Pester tests
