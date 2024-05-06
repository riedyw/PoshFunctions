Describe "[Get-LongName] Tests" {

    It "Number" {
        Get-LongName | Should -Be 15
    }

    It "Boolean" {
        Get-LongName | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-LongName | Should -Be 'Hello'
    }

}

# todo update Pester tests
