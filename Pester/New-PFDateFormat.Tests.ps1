Describe "[New-PFDateFormat] Tests" {

    It "Number" {
        New-PFDateFormat | Should -Be 15
    }

    It "Boolean" {
        New-PFDateFormat | Should -BeTrue
    }

    It "Pipeline" {
        "data" | New-PFDateFormat | Should -Be 'Hello'
    }

}

# todo update Pester tests
