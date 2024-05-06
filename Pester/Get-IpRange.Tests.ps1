Describe "[Get-IpRange] Tests" {

    It "Number" {
        Get-IpRange | Should -Be 15
    }

    It "Boolean" {
        Get-IpRange | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-IpRange | Should -Be 'Hello'
    }

}

# todo update Pester tests
