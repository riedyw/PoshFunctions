Describe "[Get-PrivateProfileSection] Tests" {

    It "Number" {
        Get-PrivateProfileSection | Should -Be 15
    }

    It "Boolean" {
        Get-PrivateProfileSection | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-PrivateProfileSection | Should -Be 'Hello'
    }

}

# todo update Pester tests
