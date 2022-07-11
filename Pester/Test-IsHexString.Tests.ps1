Describe "[Test-IsHexString] Tests" {

    It "Number" {
        Test-IsHexString | Should -Be 15
    }

    It "Boolean" {
        Test-IsHexString | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Test-IsHexString | Should -Be 'Hello'
    }

}

# todo update Pester tests
