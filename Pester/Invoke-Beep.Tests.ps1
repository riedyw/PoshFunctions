Describe "[Invoke-Beep] Tests" {

    It "Number" {
        Invoke-Beep | Should -Be 15
    }

    It "Boolean" {
        Invoke-Beep | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Invoke-Beep | Should -Be 'Hello'
    }

}

# todo update Pester tests
