Describe "[Get-SaveFileName] Tests" {

    It "Number" {
        Get-SaveFileName | Should -Be 15
    }

    It "Boolean" {
        Get-SaveFileName | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-SaveFileName | Should -Be 'Hello'
    }

}

# todo update Pester tests
