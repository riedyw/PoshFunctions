Describe "[Switch-Mute] Tests" {

    It "Number" {
        Switch-Mute | Should -Be 15
    }

    It "Boolean" {
        Switch-Mute | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Switch-Mute | Should -Be 'Hello'
    }

}

# todo update Pester tests
