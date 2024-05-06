Describe "[Format-MacAddress] Tests" {

    It "Number" {
        Format-MacAddress | Should -Be 15
    }

    It "Boolean" {
        Format-MacAddress | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Format-MacAddress | Should -Be 'Hello'
    }

}

# todo update Pester tests
