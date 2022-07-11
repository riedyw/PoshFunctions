Describe "[Get-RandomDate] Tests" {

    It "Number" {
        Get-RandomDate | Should -Be 15
    }

    It "Boolean" {
        Get-RandomDate | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-RandomDate | Should -Be 'Hello'
    }

}

# todo update Pester tests
