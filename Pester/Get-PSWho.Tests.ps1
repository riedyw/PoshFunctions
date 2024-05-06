Describe "[Get-PSWho] Tests" {

    It "Number" {
        Get-PSWho | Should -Be 15
    }

    It "Boolean" {
        Get-PSWho | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-PSWho | Should -Be 'Hello'
    }

}

# todo update Pester tests
