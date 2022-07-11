Describe "[Get-FolderName] Tests" {

    It "Number" {
        Get-FolderName | Should -Be 15
    }

    It "Boolean" {
        Get-FolderName | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-FolderName | Should -Be 'Hello'
    }

}

# todo update Pester tests
