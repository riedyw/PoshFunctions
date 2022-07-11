Describe "[Test-ConnectionAsync] Tests" {

    It "Number" {
        Test-ConnectionAsync | Should -Be 15
    }

    It "Boolean" {
        Test-ConnectionAsync | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Test-ConnectionAsync | Should -Be 'Hello'
    }

}

# todo update Pester tests
