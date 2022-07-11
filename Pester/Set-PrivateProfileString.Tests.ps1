Describe "[Set-PrivateProfileString] Tests" {

    It "Number" {
        Set-PrivateProfileString | Should -Be 15
    }

    It "Boolean" {
        Set-PrivateProfileString | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Set-PrivateProfileString | Should -Be 'Hello'
    }

}

# todo update Pester tests
