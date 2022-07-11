Describe "[New-MessageBox] Tests" {

    It "Number" {
        New-MessageBox | Should -Be 15
    }

    It "Boolean" {
        New-MessageBox | Should -BeTrue
    }

    It "Pipeline" {
        "data" | New-MessageBox | Should -Be 'Hello'
    }

}

# todo update Pester tests
