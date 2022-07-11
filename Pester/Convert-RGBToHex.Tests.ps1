Describe "[Convert-RGBToHex] Tests" {

    It "Number" {
        Convert-RGBToHex | Should -Be 15
    }

    It "Boolean" {
        Convert-RGBToHex | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Convert-RGBToHex | Should -Be 'Hello'
    }

}

# todo update Pester tests
