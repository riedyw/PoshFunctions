Describe "[Set-Display] Tests" {

    It "Number" {
        Set-Display | Should -Be 15
    }

    It "Boolean" {
        Set-Display | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Set-Display | Should -Be 'Hello'
    }

}

# todo update Pester tests
