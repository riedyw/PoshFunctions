Describe "[Get-ScheduledTaskUser] Tests" {

    It "Number" {
        Get-ScheduledTaskUser | Should -Be 15
    }

    It "Boolean" {
        Get-ScheduledTaskUser | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-ScheduledTaskUser | Should -Be 'Hello'
    }

}

# todo update Pester tests
