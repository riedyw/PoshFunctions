Describe "[mklink] Tests" {

    It "Number" {
        mklink | Should -Be 15
    }

    It "Boolean" {
        mklink | Should -BeTrue
    }

    It "Pipeline" {
        "data" | mklink | Should -Be 'Hello'
    }

}

# todo update Pester tests
