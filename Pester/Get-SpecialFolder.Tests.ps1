Describe "[Get-SpecialFolder] Tests" {

    It "Number" {
        Get-SpecialFolder | Should -Be 15
    }

    It "Boolean" {
        Get-SpecialFolder | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-SpecialFolder | Should -Be 'Hello'
    }

}

# todo update Pester tests
