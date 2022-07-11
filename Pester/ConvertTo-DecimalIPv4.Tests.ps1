Describe "[ConvertTo-DecimalIPv4] Tests" {

    It "Number" {
        ConvertTo-DecimalIPv4 | Should -Be 15
    }

    It "Boolean" {
        ConvertTo-DecimalIPv4 | Should -BeTrue
    }

    It "Pipeline" {
        "data" | ConvertTo-DecimalIPv4 | Should -Be 'Hello'
    }

}

# todo update Pester tests
