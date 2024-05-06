Describe "[Get-FileEncoding] Tests" {

    It "Number" {
        Get-FileEncoding | Should -Be 15
    }

    It "Boolean" {
        Get-FileEncoding | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-FileEncoding | Should -Be 'Hello'
    }

}

# todo update Pester tests
