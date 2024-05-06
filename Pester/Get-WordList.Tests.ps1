Describe "[Get-WordList] Tests" {

    It "Number" {
        Get-WordList | Should -Be 15
    }

    It "Boolean" {
        Get-WordList | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-WordList | Should -Be 'Hello'
    }

}

# todo update Pester tests
