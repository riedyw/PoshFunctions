Describe "[Get-SID] Tests" {

    It "Number" {
        Get-SID | Should -Be 15
    }

    It "Boolean" {
        Get-SID | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-SID | Should -Be 'Hello'
    }

}

# todo update Pester tests
