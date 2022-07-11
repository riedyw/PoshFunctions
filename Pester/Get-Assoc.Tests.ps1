Describe "[Get-Assoc] Tests" {

    It "Number" {
        Get-Assoc | Should -Be 15
    }

    It "Boolean" {
        Get-Assoc | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-Assoc | Should -Be 'Hello'
    }

}

# todo update Pester tests
