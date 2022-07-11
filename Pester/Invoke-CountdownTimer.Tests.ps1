Describe "[Invoke-CountdownTimer] Tests" {

    It "Number" {
        Invoke-CountdownTimer | Should -Be 15
    }

    It "Boolean" {
        Invoke-CountdownTimer | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Invoke-CountdownTimer | Should -Be 'Hello'
    }

}

# todo update Pester tests
