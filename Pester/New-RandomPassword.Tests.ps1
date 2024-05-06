Describe "[New-RandomPassword] Tests" {

    It "Number" {
        New-RandomPassword | Should -Be 15
    }

    It "Boolean" {
        New-RandomPassword | Should -BeTrue
    }

    It "Pipeline" {
        "data" | New-RandomPassword | Should -Be 'Hello'
    }

}

# todo update Pester tests
