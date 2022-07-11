Describe "[Read-HostWithDefault] Tests" {

    It "Number" {
        Read-HostWithDefault | Should -Be 15
    }

    It "Boolean" {
        Read-HostWithDefault | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Read-HostWithDefault | Should -Be 'Hello'
    }

}

# todo update Pester tests
