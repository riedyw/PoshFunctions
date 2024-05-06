Describe "[Get-RandomMacAddress] Tests" {

    It "Number" {
        Get-RandomMacAddress | Should -Be 15
    }

    It "Boolean" {
        Get-RandomMacAddress | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-RandomMacAddress | Should -Be 'Hello'
    }

}

# todo update Pester tests
