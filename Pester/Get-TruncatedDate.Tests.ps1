Describe "[Get-TruncatedDate] Tests" {

    It "Number" {
        Get-TruncatedDate | Should -Be 15
    }

    It "Boolean" {
        Get-TruncatedDate | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-TruncatedDate | Should -Be 'Hello'
    }

}

# todo update Pester tests
