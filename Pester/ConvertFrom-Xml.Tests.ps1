Describe "[ConvertFrom-Xml] Tests" {

    It "Number" {
        ConvertFrom-Xml | Should -Be 15
    }

    It "Boolean" {
        ConvertFrom-Xml | Should -BeTrue
    }

    It "Pipeline" {
        "data" | ConvertFrom-Xml | Should -Be 'Hello'
    }

}

# todo pester tests
