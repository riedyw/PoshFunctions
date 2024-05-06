Describe "[Remove-Trailing] Tests" {

    It "Number" {
        Remove-Trailing | Should -Be 15
    }

    It "Boolean" {
        Remove-Trailing | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Remove-Trailing | Should -Be 'Hello'
    }

}

# todo update Pester tests
