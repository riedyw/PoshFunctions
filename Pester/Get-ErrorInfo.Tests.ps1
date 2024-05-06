Describe "[Get-ErrorInfo] Tests" {

    It "Number" {
        Get-ErrorInfo | Should -Be 15
    }

    It "Boolean" {
        Get-ErrorInfo | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-ErrorInfo | Should -Be 'Hello'
    }

}

# todo update Pester tests
