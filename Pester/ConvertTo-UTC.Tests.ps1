Describe "[ConvertTo-UTC] Tests" {

    It "Number" {
        ConvertTo-UTC | Should -Be 15
    }

    It "Boolean" {
        ConvertTo-UTC | Should -BeTrue
    }

    It "Pipeline" {
        "data" | ConvertTo-UTC | Should -Be 'Hello'
    }

}

# todo update Pester tests
