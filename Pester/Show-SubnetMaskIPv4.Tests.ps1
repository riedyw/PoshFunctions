Describe "[Show-SubnetMaskIPv4] Tests" {

    It "Number" {
        Show-SubnetMaskIPv4 | Should -Be 15
    }

    It "Boolean" {
        Show-SubnetMaskIPv4 | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Show-SubnetMaskIPv4 | Should -Be 'Hello'
    }

}

# todo update Pester tests
