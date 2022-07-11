Describe "[Get-DiceRoll] Tests" {

    It "Number" {
        Get-DiceRoll | Should -Be 15
    }

    It "Boolean" {
        Get-DiceRoll | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-DiceRoll | Should -Be 'Hello'
    }

}

# todo update Pester tests
