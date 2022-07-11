Describe "[Get-Fortune] Tests" {

    It "Number" {
        Get-Fortune | Should -Be 15
    }

    It "Boolean" {
        Get-Fortune | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-Fortune | Should -Be 'Hello'
    }

}

# todo update Pester tests
