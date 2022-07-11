Describe "[ConvertTo-UrlEncode] Tests" {

    It "Number" {
        ConvertTo-UrlEncode | Should -Be 15
    }

    It "Boolean" {
        ConvertTo-UrlEncode | Should -BeTrue
    }

    It "Pipeline" {
        "data" | ConvertTo-UrlEncode | Should -Be 'Hello'
    }

}

# todo update Pester tests
