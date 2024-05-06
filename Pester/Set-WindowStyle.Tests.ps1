Describe "[Set-WindowStyle] Tests" {

    It "Number" {
        Set-WindowStyle | Should -Be 15
    }

    It "Boolean" {
        Set-WindowStyle | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Set-WindowStyle | Should -Be 'Hello'
    }

}

# todo update Pester tests
