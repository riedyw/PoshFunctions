Describe "[New-InputBox] Tests" {

    It "Number" {
        New-InputBox | Should -Be 15
    }

    It "Boolean" {
        New-InputBox | Should -BeTrue
    }

    It "Pipeline" {
        "data" | New-InputBox | Should -Be 'Hello'
    }

}

# todo update Pester tests
