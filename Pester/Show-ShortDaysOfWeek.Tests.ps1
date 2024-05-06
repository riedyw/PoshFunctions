Describe "[Show-ShortDaysOfWeek] Tests" {

    It "Number" {
        Show-ShortDaysOfWeek | Should -Be 15
    }

    It "Boolean" {
        Show-ShortDaysOfWeek | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Show-ShortDaysOfWeek | Should -Be 'Hello'
    }

}

# todo update Pester tests
