Describe "[ConvertTo-BinaryIPv4] Tests" {

    It "Number" {
        ConvertTo-BinaryIPv4 | Should -Be 15
    }

    It "Boolean" {
        ConvertTo-BinaryIPv4 | Should -BeTrue
    }

    It "Pipeline" {
        "data" | ConvertTo-BinaryIPv4 | Should -Be 'Hello'
    }

}

# todo update Pester tests
