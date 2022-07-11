Describe "[Get-NtpDate] Tests" {

    It "Number" {
        Get-NtpDate | Should -Be 15
    }

    It "Boolean" {
        Get-NtpDate | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-NtpDate | Should -Be 'Hello'
    }

}

# todo update Pester tests
