Describe "[Optimize-SqlIndexFragmentation] Tests" {

    It "Number" {
        Optimize-SqlIndexFragmentation | Should -Be 15
    }

    It "Boolean" {
        Optimize-SqlIndexFragmentation | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Optimize-SqlIndexFragmentation | Should -Be 'Hello'
    }

}

# todo update Pester tests
