Describe "[Convert-ObjectToHashtable] Tests" {

    It "Number" {
        Convert-ObjectToHashtable | Should -Be 15
    }

    It "Boolean" {
        Convert-ObjectToHashtable | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Convert-ObjectToHashtable | Should -Be 'Hello'
    }

}
# todo pester tests
