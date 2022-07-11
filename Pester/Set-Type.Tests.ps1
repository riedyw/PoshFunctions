Describe "[Set-Type] Tests" {

    It "Number" {
        Set-Type | Should -Be 15
    }

    It "Boolean" {
        Set-Type | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Set-Type | Should -Be 'Hello'
    }

}

# todo update Pester tests
