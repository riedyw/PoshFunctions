Describe "[grep] Tests" {

    It "Number" {
        grep | Should -Be 15
    }

    It "Boolean" {
        grep | Should -BeTrue
    }

    It "Pipeline" {
        "data" | grep | Should -Be 'Hello'
    }

}

# todo update Pester tests
