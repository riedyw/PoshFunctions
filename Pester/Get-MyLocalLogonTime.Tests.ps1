Describe "[Get-MyLocalLogonTime] Tests" {

    It "Number" {
        Get-MyLocalLogonTime | Should -Be 15
    }

    It "Boolean" {
        Get-MyLocalLogonTime | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-MyLocalLogonTime | Should -Be 'Hello'
    }

}

# todo update Pester tests
