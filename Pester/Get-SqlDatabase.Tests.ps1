Describe "[Get-SqlDatabase] Tests" {

    It "Number" {
        Get-SqlDatabase | Should -Be 15
    }

    It "Boolean" {
        Get-SqlDatabase | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-SqlDatabase | Should -Be 'Hello'
    }

}

# todo update Pester tests
