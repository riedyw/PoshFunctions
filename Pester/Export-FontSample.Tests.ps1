Describe "[Export-FontSample] Tests" {

    It "Number" {
        Export-FontSample | Should -Be 15
    }

    It "Boolean" {
        Export-FontSample | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Export-FontSample | Should -Be 'Hello'
    }

}

# todo update Pester tests
