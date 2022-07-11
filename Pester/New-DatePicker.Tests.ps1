Describe "[New-DatePicker] Tests" {

    It "Number" {
        New-DatePicker | Should -Be 15
    }

    It "Boolean" {
        New-DatePicker | Should -BeTrue
    }

    It "Pipeline" {
        "data" | New-DatePicker | Should -Be 'Hello'
    }

}

# todo update Pester tests
