Describe "[Get-NTFSPermission] Tests" {

    It "Number" {
        Get-NTFSPermission | Should -Be 15
    }

    It "Boolean" {
        Get-NTFSPermission | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-NTFSPermission | Should -Be 'Hello'
    }

}

# todo update Pester tests
