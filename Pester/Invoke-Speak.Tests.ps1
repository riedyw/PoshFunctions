Describe "[Invoke-Speak] Tests" {

    It "Number" {
        Invoke-Speak | Should -Be 15
    }

    It "Boolean" {
        Invoke-Speak | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Invoke-Speak | Should -Be 'Hello'
    }

}

# todo update Pester tests
