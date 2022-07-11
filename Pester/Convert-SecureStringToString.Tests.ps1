Describe "[Convert-SecureStringToString] Tests" {

    It "Number" {
        Convert-SecureStringToString | Should -Be 15
    }

    It "Boolean" {
        Convert-SecureStringToString | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Convert-SecureStringToString | Should -Be 'Hello'
    }

}

# todo update Pester tests
