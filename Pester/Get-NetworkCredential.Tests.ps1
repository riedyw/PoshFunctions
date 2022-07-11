Describe "[Get-NetworkCredential] Tests" {

    It "Number" {
        Get-NetworkCredential | Should -Be 15
    }

    It "Boolean" {
        Get-NetworkCredential | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-NetworkCredential | Should -Be 'Hello'
    }

}

# todo update Pester tests
