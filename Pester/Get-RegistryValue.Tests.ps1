Describe "[Get-RegistryValue] Tests" {

    It "Number" {
        Get-RegistryValue | Should -Be 15
    }

    It "Boolean" {
        Get-RegistryValue | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-RegistryValue | Should -Be 'Hello'
    }

}

# todo update Pester tests
