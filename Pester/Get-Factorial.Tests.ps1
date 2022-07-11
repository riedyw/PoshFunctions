Describe "[Get-Factorial] Tests" {

    It "Number" {
        Get-Factorial | Should -Be 15
    }

    It "Boolean" {
        Get-Factorial | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-Factorial | Should -Be 'Hello'
    }

}

# todo update Pester tests
