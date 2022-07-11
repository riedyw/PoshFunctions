Describe "[Get-ServiceUser] Tests" {

    It "Number" {
        Get-ServiceUser | Should -Be 15
    }

    It "Boolean" {
        Get-ServiceUser | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-ServiceUser | Should -Be 'Hello'
    }

}

# todo update Pester tests
