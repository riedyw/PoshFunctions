Describe "[Get-Magic8Ball] Tests" {

    It "Number" {
        Get-Magic8Ball | Should -Be 15
    }

    It "Boolean" {
        Get-Magic8Ball | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-Magic8Ball | Should -Be 'Hello'
    }

}

# todo update Pester tests
