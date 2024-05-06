Describe "[New-InputBoxSecureString] Tests" {

    It "Number" {
        New-InputBoxSecureString | Should -Be 15
    }

    It "Boolean" {
        New-InputBoxSecureString | Should -BeTrue
    }

    It "Pipeline" {
        "data" | New-InputBoxSecureString | Should -Be 'Hello'
    }

}

# todo update Pester tests
