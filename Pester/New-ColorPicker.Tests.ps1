Describe "[New-ColorPicker] Tests" {

    It "Number" {
        New-ColorPicker | Should -Be 15
    }

    It "Boolean" {
        New-ColorPicker | Should -BeTrue
    }

    It "Pipeline" {
        "data" | New-ColorPicker | Should -Be 'Hello'
    }

}

# todo update Pester tests
