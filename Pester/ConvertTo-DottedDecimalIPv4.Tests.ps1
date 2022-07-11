Describe "[ConvertTo-DottedDecimalIPv4] Tests" {

    It "Number" {
        ConvertTo-DottedDecimalIPv4 | Should -Be 15
    }

    It "Boolean" {
        ConvertTo-DottedDecimalIPv4 | Should -BeTrue
    }

    It "Pipeline" {
        "data" | ConvertTo-DottedDecimalIPv4 | Should -Be 'Hello'
    }

}

# todo update Pester tests
