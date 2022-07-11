Describe "[Get-Md5Sum] Tests" {

    It "Number" {
        Get-Md5Sum | Should -Be 15
    }

    It "Boolean" {
        Get-Md5Sum | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-Md5Sum | Should -Be 'Hello'
    }

}

# todo update Pester tests
