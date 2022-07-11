Describe "[Format-WrapText] Tests" {

    It "Number" {
        Format-WrapText | Should -Be 15
    }

    It "Boolean" {
        Format-WrapText | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Format-WrapText | Should -Be 'Hello'
    }

}

# todo update Pester tests
