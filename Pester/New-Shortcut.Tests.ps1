Describe "[New-Shortcut] Tests" {

    It "Number" {
        New-Shortcut | Should -Be 15
    }

    It "Boolean" {
        New-Shortcut | Should -BeTrue
    }

    It "Pipeline" {
        "data" | New-Shortcut | Should -Be 'Hello'
    }

}

# todo update Pester tests
