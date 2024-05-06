Describe "[Get-Round] Tests" {

    It "Number" {
        Get-Round | Should -Be 15
    }

    It "Boolean" {
        Get-Round | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-Round | Should -Be 'Hello'
    }

}

# todo update Pester tests
