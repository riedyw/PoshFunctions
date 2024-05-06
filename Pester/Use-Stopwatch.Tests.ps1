Describe "[Use-Stopwatch] Tests" {

    It "Number" {
        Use-Stopwatch | Should -Be 15
    }

    It "Boolean" {
        Use-Stopwatch | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Use-Stopwatch | Should -Be 'Hello'
    }

}

# todo update Pester tests
