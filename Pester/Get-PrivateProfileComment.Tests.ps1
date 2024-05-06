Describe "[Get-PrivateProfileComment] Tests" {

    It "Number" {
        Get-PrivateProfileComment | Should -Be 15
    }

    It "Boolean" {
        Get-PrivateProfileComment | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-PrivateProfileComment | Should -Be 'Hello'
    }

}

# todo update Pester tests
