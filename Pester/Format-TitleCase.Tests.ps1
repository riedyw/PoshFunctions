Describe "[Format-TitleCase] Tests" {

    It "Number" {
        Format-TitleCase | Should -Be 15
    }

    It "Boolean" {
        Format-TitleCase | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Format-TitleCase | Should -Be 'Hello'
    }

}

# todo update Pester tests
