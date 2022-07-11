Describe "[Remove-EmptyProperty] Tests" {

    It "Number" {
        Remove-EmptyProperty | Should -Be 15
    }

    It "Boolean" {
        Remove-EmptyProperty | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Remove-EmptyProperty | Should -Be 'Hello'
    }

}

# todo update Pester tests
