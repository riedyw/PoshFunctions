Describe "[Get-FileName] Tests" {

    It "Number" {
        Get-FileName | Should -Be 15
    }

    It "Boolean" {
        Get-FileName | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-FileName | Should -Be 'Hello'
    }

}

# todo update Pester tests
