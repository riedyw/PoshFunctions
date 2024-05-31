Describe "[Compare-ObjectProperty] Tests" {

    It "Number" {
        Compare-ObjectProperty | Should -Be 15
    }

    It "Boolean" {
        Compare-ObjectProperty | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Compare-ObjectProperty | Should -Be 'Hello'
    }

}

# todo pester tests
