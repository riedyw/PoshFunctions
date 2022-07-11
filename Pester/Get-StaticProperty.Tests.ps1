Describe "[Get-StaticProperty] Tests" {

    It "Number" {
        Get-StaticProperty | Should -Be 15
    }

    It "Boolean" {
        Get-StaticProperty | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-StaticProperty | Should -Be 'Hello'
    }

}

# todo update Pester tests
