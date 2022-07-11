Describe "[Export-CSVSortedColumn] Tests" {

    It "Number" {
        Export-CSVSortedColumn | Should -Be 15
    }

    It "Boolean" {
        Export-CSVSortedColumn | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Export-CSVSortedColumn | Should -Be 'Hello'
    }

}

# todo update Pester tests
