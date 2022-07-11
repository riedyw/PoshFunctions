Describe "[ConvertTo-Base64] Tests" {

    It "Number" {
        ConvertTo-Base64 | Should -Be 15
    }

    It "Boolean" {
        ConvertTo-Base64 | Should -BeTrue
    }

    It "Pipeline" {
        "data" | ConvertTo-Base64 | Should -Be 'Hello'
    }

}

# todo update Pester tests
