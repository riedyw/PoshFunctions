Describe "[Get-DuplicateFileName] Tests" {

    It "Number" {
        Get-DuplicateFileName | Should -Be 15
    }

    It "Boolean" {
        Get-DuplicateFileName | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-DuplicateFileName | Should -Be 'Hello'
    }

}

# todo update Pester tests
