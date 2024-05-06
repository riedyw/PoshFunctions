Describe "[ConvertTo-DateTime] Tests" {

    It "Number" {
        ConvertTo-DateTime | Should -Be 15
    }

    It "Boolean" {
        ConvertTo-DateTime | Should -BeTrue
    }

    It "Pipeline" {
        "data" | ConvertTo-DateTime | Should -Be 'Hello'
    }

}

# todo update Pester tests
