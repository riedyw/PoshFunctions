Describe "[Get-ComputerUptime] Tests" {

    It "Number" {
        Get-ComputerUptime | Should -Be 15
    }

    It "Boolean" {
        Get-ComputerUptime | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-ComputerUptime | Should -Be 'Hello'
    }

}

# todo update Pester tests
