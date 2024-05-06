Describe "[Expand-IPv6] Tests" {

    It "Number" {
        Expand-IPv6 | Should -Be 15
    }

    It "Boolean" {
        Expand-IPv6 | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Expand-IPv6 | Should -Be 'Hello'
    }

}

# todo update Pester tests
