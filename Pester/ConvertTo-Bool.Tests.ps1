Describe "[ConvertTo-Bool] Tests" {

    It "Number" {
        ConvertTo-Bool | Should -Be 15
    }

    It "Boolean" {
        ConvertTo-Bool | Should -BeTrue
    }

    It "Pipeline" {
        "data" | ConvertTo-Bool | Should -Be 'Hello'
    }

}

# todo update Pester tests
