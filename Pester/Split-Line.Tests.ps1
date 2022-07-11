Describe "[Split-Line] Tests" {

    It "Number" {
        Split-Line | Should -Be 15
    }

    It "Boolean" {
        Split-Line | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Split-Line | Should -Be 'Hello'
    }

}

# todo update Pester tests
