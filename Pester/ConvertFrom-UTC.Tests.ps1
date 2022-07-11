Describe "[ConvertFrom-UTC] Tests" {

    It "Number" {
        ConvertFrom-UTC | Should -Be 15
    }

    It "Boolean" {
        ConvertFrom-UTC | Should -BeTrue
    }

    It "Pipeline" {
        "data" | ConvertFrom-UTC | Should -Be 'Hello'
    }

}

# todo update Pester tests
