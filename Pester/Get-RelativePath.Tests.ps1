Describe "[Get-RelativePath] Tests" {

    It "Number" {
        Get-RelativePath | Should -Be 15
    }

    It "Boolean" {
        Get-RelativePath | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-RelativePath | Should -Be 'Hello'
    }

}

# todo update Pester tests
