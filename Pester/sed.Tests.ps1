Describe "[sed] Tests" {

    It "Number" {
        sed | Should -Be 15
    }

    It "Boolean" {
        sed | Should -BeTrue
    }

    It "Pipeline" {
        "data" | sed | Should -Be 'Hello'
    }

}

# todo update Pester tests
