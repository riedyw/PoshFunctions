Describe "[Resolve-HostName] Tests" {

    It "Number" {
        Resolve-HostName | Should -Be 15
    }

    It "Boolean" {
        Resolve-HostName | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Resolve-HostName | Should -Be 'Hello'
    }

}

# todo update Pester tests
