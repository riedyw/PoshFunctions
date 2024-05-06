Describe "[Get-PrivateProfileSectionNames] Tests" {

    It "Number" {
        Get-PrivateProfileSectionNames | Should -Be 15
    }

    It "Boolean" {
        Get-PrivateProfileSectionNames | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-PrivateProfileSectionNames | Should -Be 'Hello'
    }

}

# todo update Pester tests
