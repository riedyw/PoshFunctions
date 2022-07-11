Describe "[Optimize-SqlStoredProcedure] Tests" {

    It "Number" {
        Optimize-SqlStoredProcedure | Should -Be 15
    }

    It "Boolean" {
        Optimize-SqlStoredProcedure | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Optimize-SqlStoredProcedure | Should -Be 'Hello'
    }

}

# todo update Pester tests
