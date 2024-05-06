Describe "[Get-DNSHostEntryAsync] Tests" {

    It "Number" {
        Get-DNSHostEntryAsync | Should -Be 15
    }

    It "Boolean" {
        Get-DNSHostEntryAsync | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-DNSHostEntryAsync | Should -Be 'Hello'
    }

}

# todo update Pester tests
