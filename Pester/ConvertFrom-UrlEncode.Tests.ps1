Describe "[ConvertFrom-UrlEncode] Tests" {

    It "Number" {
        ConvertFrom-UrlEncode | Should -Be 15
    }

    It "Boolean" {
        ConvertFrom-UrlEncode | Should -BeTrue
    }

    It "Pipeline" {
        "data" | ConvertFrom-UrlEncode | Should -Be 'Hello'
    }

}

# todo update Pester tests
