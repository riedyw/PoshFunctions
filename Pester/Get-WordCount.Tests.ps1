Describe "[Get-WordCount] Tests" {

    It "Number" {
        Get-WordCount | Should -Be 15
    }

    It "Boolean" {
        Get-WordCount | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-WordCount | Should -Be 'Hello'
    }

}

# todo update Pester tests
