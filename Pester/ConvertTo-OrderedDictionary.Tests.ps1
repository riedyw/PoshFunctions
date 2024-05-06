Describe "[ConvertTo-OrderedDictionary] Tests" {

    It "Number" {
        ConvertTo-OrderedDictionary | Should -Be 15
    }

    It "Boolean" {
        ConvertTo-OrderedDictionary | Should -BeTrue
    }

    It "Pipeline" {
        "data" | ConvertTo-OrderedDictionary | Should -Be 'Hello'
    }

}

# todo update Pester tests
