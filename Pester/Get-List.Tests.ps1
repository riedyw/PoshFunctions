Describe "[Get-List] Tests" {

    It "Number" {
        Get-List | Should -Be 15
    }

    It "Boolean" {
        Get-List | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-List | Should -Be 'Hello'
    }

}

# todo update Pester tests
