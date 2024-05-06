Describe "[Get-SqlIndexFragmentation] Tests" {

    It "Number" {
        Get-SqlIndexFragmentation | Should -Be 15
    }

    It "Boolean" {
        Get-SqlIndexFragmentation | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-SqlIndexFragmentation | Should -Be 'Hello'
    }

}

# todo update Pester tests
