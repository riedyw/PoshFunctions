Describe "[Get-Shortcut] Tests" {

    It "Number" {
        Get-Shortcut | Should -Be 15
    }

    It "Boolean" {
        Get-Shortcut | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-Shortcut | Should -Be 'Hello'
    }

}

# todo update Pester tests
