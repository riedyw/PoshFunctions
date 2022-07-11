Describe "[Get-PrivateProfileString] Tests" {

    It "Number" {
        Get-PrivateProfileString | Should -Be 15
    }

    It "Boolean" {
        Get-PrivateProfileString | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-PrivateProfileString | Should -Be 'Hello'
    }

}

# todo update Pester tests
