Describe "[Get-ShortName] Tests" {

    It "Number" {
        Get-ShortName | Should -Be 15
    }

    It "Boolean" {
        Get-ShortName | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-ShortName | Should -Be 'Hello'
    }

}

# todo update Pester tests
