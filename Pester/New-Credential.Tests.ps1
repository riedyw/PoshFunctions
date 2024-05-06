Describe "[New-Credential] Tests" {

    It "Number" {
        New-Credential | Should -Be 15
    }

    It "Boolean" {
        New-Credential | Should -BeTrue
    }

    It "Pipeline" {
        "data" | New-Credential | Should -Be 'Hello'
    }

}

# todo update Pester tests
