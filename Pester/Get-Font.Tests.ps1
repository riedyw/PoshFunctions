Describe "[Get-Font] Tests" {

    It "Number" {
        Get-Font | Should -Be 15
    }

    It "Boolean" {
        Get-Font | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-Font | Should -Be 'Hello'
    }

}

# todo update Pester tests
