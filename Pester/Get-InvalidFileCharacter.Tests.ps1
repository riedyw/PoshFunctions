Describe "[Get-InvalidFileCharacter] Tests" {

    It "Number" {
        Get-InvalidFileCharacter | Should -Be 15
    }

    It "Boolean" {
        Get-InvalidFileCharacter | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-InvalidFileCharacter | Should -Be 'Hello'
    }

}

# todo update Pester tests
