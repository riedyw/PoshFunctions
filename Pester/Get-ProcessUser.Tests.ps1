Describe "[Get-ProcessUser] Tests" {

    It "Number" {
        Get-ProcessUser | Should -Be 15
    }

    It "Boolean" {
        Get-ProcessUser | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-ProcessUser | Should -Be 'Hello'
    }

}

# todo update Pester tests
