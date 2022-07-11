Describe "[Get-LastDayInMonth] Tests" {

    It "Number" {
        Get-LastDayInMonth | Should -Be 15
    }

    It "Boolean" {
        Get-LastDayInMonth | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-LastDayInMonth | Should -Be 'Hello'
    }

}

# todo update Pester tests
