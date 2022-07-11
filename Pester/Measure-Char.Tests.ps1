Describe "[Measure-Char] Tests" {

    It "Number" {
        Measure-Char | Should -Be 15
    }

    It "Boolean" {
        Measure-Char | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Measure-Char | Should -Be 'Hello'
    }

}

# todo update Pester tests
