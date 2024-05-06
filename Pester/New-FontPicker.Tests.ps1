Describe "[New-FontPicker] Tests" {

    It "Number" {
        New-FontPicker | Should -Be 15
    }

    It "Boolean" {
        New-FontPicker | Should -BeTrue
    }

    It "Pipeline" {
        "data" | New-FontPicker | Should -Be 'Hello'
    }

}

# todo update Pester tests
