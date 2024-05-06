Describe "[Get-DriveStat] Tests" {

    It "Number" {
        Get-DriveStat | Should -Be 15
    }

    It "Boolean" {
        Get-DriveStat | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-DriveStat | Should -Be 'Hello'
    }

}

# todo update Pester tests
