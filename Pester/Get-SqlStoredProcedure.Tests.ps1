Describe "[Get-SqlStoredProcedure] Tests" {

    It "Number" {
        Get-SqlStoredProcedure | Should -Be 15
    }

    It "Boolean" {
        Get-SqlStoredProcedure | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-SqlStoredProcedure | Should -Be 'Hello'
    }

}

# todo update Pester tests
