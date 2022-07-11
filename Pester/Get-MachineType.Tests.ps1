Describe "[Get-MachineType] Tests" {

    It "Number" {
        Get-MachineType | Should -Be 15
    }

    It "Boolean" {
        Get-MachineType | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-MachineType | Should -Be 'Hello'
    }

}

# todo update Pester tests
