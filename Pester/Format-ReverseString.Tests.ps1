Describe "[Format-ReverseString] Tests" {

    It "Number" {
        Format-ReverseString | Should -Be 15
    }

    It "Boolean" {
        Format-ReverseString | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Format-ReverseString | Should -Be 'Hello'
    }

}

# todo update Pester tests
