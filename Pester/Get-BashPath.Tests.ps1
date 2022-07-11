Describe "[Get-BashPath] Tests" {

    It "Number" {
        Get-BashPath | Should -Be 15
    }

    It "Boolean" {
        Get-BashPath | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-BashPath | Should -Be 'Hello'
    }

}

# todo update Pester tests
