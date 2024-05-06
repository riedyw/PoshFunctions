Describe "[Get-SubnetMaskIPv4] Tests" {

    It "Number" {
        Get-SubnetMaskIPv4 | Should -Be 15
    }

    It "Boolean" {
        Get-SubnetMaskIPv4 | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-SubnetMaskIPv4 | Should -Be 'Hello'
    }

}

# todo update Pester tests
