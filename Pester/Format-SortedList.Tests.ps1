Describe "[Format-SortedList] Tests" {

    It "Number" {
        Format-SortedList | Should -Be 15
    }

    It "Boolean" {
        Format-SortedList | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Format-SortedList | Should -Be 'Hello'
    }

}

# todo update Pester tests
