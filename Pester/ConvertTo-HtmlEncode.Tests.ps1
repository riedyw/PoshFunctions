Describe "[ConvertTo-HtmlEncode] Tests" {

    It "Number" {
        ConvertTo-HtmlEncode | Should -Be 15
    }

    It "Boolean" {
        ConvertTo-HtmlEncode | Should -BeTrue
    }

    It "Pipeline" {
        "data" | ConvertTo-HtmlEncode | Should -Be 'Hello'
    }

}

# todo update Pester tests
