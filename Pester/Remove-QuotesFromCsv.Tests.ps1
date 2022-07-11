Describe "[Remove-QuotesFromCsv] Tests" {

    It "Number" {
        Remove-QuotesFromCsv | Should -Be 15
    }

    It "Boolean" {
        Remove-QuotesFromCsv | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Remove-QuotesFromCsv | Should -Be 'Hello'
    }

}

# todo update Pester tests
