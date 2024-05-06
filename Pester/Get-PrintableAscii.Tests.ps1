Describe "[Get-PrintableAscii] Tests" {

    It "Number" {
        Get-PrintableAscii | Should -Be 15
    }

    It "Boolean" {
        Get-PrintableAscii | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-PrintableAscii | Should -Be 'Hello'
    }

}

# todo update Pester tests
