Describe "[Format-RandomCase] Tests" {

    It "Number" {
        Format-RandomCase | Should -Be 15
    }

    It "Boolean" {
        Format-RandomCase | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Format-RandomCase | Should -Be 'Hello'
    }

}

# todo update Pester tests
