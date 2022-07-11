Describe "[Get-UrlContent] Tests" {

    It "Number" {
        Get-UrlContent | Should -Be 15
    }

    It "Boolean" {
        Get-UrlContent | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-UrlContent | Should -Be 'Hello'
    }

}

# todo update Pester tests
