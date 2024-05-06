Describe "[Reset-Desktop] Tests" {

    It "Number" {
        Reset-Desktop | Should -Be 15
    }

    It "Boolean" {
        Reset-Desktop | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Reset-Desktop | Should -Be 'Hello'
    }

}

# todo update Pester tests
