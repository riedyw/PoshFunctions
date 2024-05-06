Describe "[Get-ExecutableForFile] Tests" {

    It "Number" {
        Get-ExecutableForFile | Should -Be 15
    }

    It "Boolean" {
        Get-ExecutableForFile | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-ExecutableForFile | Should -Be 'Hello'
    }

}

# todo update Pester tests
