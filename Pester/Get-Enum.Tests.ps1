Describe "[Get-Enum] Tests" {

    It "Number" {
        Get-Enum | Should -Be 15
    }

    It "Boolean" {
        Get-Enum | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-Enum | Should -Be 'Hello'
    }

}

# todo update Pester tests
