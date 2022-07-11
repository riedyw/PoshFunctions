Describe "[Get-RegExpandString] Tests" {

    It "Number" {
        Get-RegExpandString | Should -Be 15
    }

    It "Boolean" {
        Get-RegExpandString | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-RegExpandString | Should -Be 'Hello'
    }

}

# todo update Pester tests
