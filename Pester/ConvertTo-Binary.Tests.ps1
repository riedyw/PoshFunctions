Describe "[ConvertTo-Binary] Tests" {

    It "Number" {
        ConvertTo-Binary | Should -Be 15
    }

    It "Boolean" {
        ConvertTo-Binary | Should -BeTrue
    }

    It "Pipeline" {
        "data" | ConvertTo-Binary | Should -Be 'Hello'
    }

}

# todo update Pester tests
