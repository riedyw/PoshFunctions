Describe "[Format-ReverseToken] Tests" {

    It "Number" {
        Format-ReverseToken | Should -Be 15
    }

    It "Boolean" {
        Format-ReverseToken | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Format-ReverseToken | Should -Be 'Hello'
    }

}

# todo update Pester tests
