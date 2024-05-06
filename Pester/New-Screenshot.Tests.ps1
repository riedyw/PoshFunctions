Describe "[New-Screenshot] Tests" {

    It "Number" {
        New-Screenshot | Should -Be 15
    }

    It "Boolean" {
        New-Screenshot | Should -BeTrue
    }

    It "Pipeline" {
        "data" | New-Screenshot | Should -Be 'Hello'
    }

}

# todo update Pester tests
