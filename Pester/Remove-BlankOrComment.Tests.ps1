Describe "[Remove-BlankOrComment] Tests" {

    It "Number" {
        Remove-BlankOrComment | Should -Be 15
    }

    It "Boolean" {
        Remove-BlankOrComment | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Remove-BlankOrComment | Should -Be 'Hello'
    }

}

# todo update Pester tests
