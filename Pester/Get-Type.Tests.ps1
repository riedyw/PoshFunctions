Describe "[Get-Type] Tests" {

    It "Number" {
        Get-Type | Should -Be 15
    }

    It "Boolean" {
        Get-Type | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-Type | Should -Be 'Hello'
    }

}

# todo update Pester tests
