Describe "[Get-DisplayBrightness] Tests" {

    It "Number" {
        Get-DisplayBrightness | Should -Be 15
    }

    It "Boolean" {
        Get-DisplayBrightness | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-DisplayBrightness | Should -Be 'Hello'
    }

}

# todo update Pester tests
