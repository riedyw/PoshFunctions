Describe "[Get-FileWithLeadingSpace] Tests" {

    It "Number" {
        Get-FileWithLeadingSpace | Should -Be 15
    }

    It "Boolean" {
        Get-FileWithLeadingSpace | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-FileWithLeadingSpace | Should -Be 'Hello'
    }

}

# todo update Pester tests
