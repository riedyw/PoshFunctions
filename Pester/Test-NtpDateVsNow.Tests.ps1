Describe "[Test-NtpDateVsNow] Tests" {

    It "Number" {
        Test-NtpDateVsNow | Should -Be 15
    }

    It "Boolean" {
        Test-NtpDateVsNow | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Test-NtpDateVsNow | Should -Be 'Hello'
    }

}

# todo update Pester tests
