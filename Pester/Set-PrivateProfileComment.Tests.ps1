Describe "[Set-PrivateProfileComment] Tests" {

    It "Number" {
        Set-PrivateProfileComment | Should -Be 15
    }

    It "Boolean" {
        Set-PrivateProfileComment | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Set-PrivateProfileComment | Should -Be 'Hello'
    }

}

# todo update Pester tests
