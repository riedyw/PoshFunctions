Describe "[Get-ComputerSite] Tests" {

    It "Number" {
        Get-ComputerSite | Should -Be 15
    }

    It "Boolean" {
        Get-ComputerSite | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-ComputerSite | Should -Be 'Hello'
    }

}

# todo update Pester tests
