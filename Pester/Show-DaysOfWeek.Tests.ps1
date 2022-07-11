Describe "[Show-DaysOfWeek] Tests" {

    It "Number" {
        Show-DaysOfWeek | Should -Be 15
    }

    It "Boolean" {
        Show-DaysOfWeek | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Show-DaysOfWeek | Should -Be 'Hello'
    }

}

# todo update Pester tests
