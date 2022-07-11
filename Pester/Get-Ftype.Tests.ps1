Describe "[Get-Ftype] Tests" {

    It "Number" {
        Get-Ftype | Should -Be 15
    }

    It "Boolean" {
        Get-Ftype | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-Ftype | Should -Be 'Hello'
    }

}

# todo update Pester tests
