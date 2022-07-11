Describe "[Get-String] Tests" {

    It "Number" {
        Get-String | Should -Be 15
    }

    It "Boolean" {
        Get-String | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-String | Should -Be 'Hello'
    }

}

# todo update Pester tests
