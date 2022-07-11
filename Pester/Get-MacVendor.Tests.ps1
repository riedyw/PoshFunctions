Describe "[Get-MacVendor] Tests" {

    It "Number" {
        Get-MacVendor | Should -Be 15
    }

    It "Boolean" {
        Get-MacVendor | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-MacVendor | Should -Be 'Hello'
    }

}

# todo update Pester tests
