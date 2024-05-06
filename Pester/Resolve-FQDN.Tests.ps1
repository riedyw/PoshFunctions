Describe "[Resolve-FQDN] Tests" {

    It "Number" {
        Resolve-FQDN | Should -Be 15
    }

    It "Boolean" {
        Resolve-FQDN | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Resolve-FQDN | Should -Be 'Hello'
    }

}

# todo update Pester tests
