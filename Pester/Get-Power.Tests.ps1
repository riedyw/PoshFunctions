Describe "[Get-Power] Tests" {

    It "Number" {
        Get-Power | Should -Be 15
    }

    It "Boolean" {
        Get-Power | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-Power | Should -Be 'Hello'
    }

}

# todo update Pester tests
