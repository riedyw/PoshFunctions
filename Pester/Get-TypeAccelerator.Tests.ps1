Describe "[Get-TypeAccelerator] Tests" {

    It "Number" {
        Get-TypeAccelerator | Should -Be 15
    }

    It "Boolean" {
        Get-TypeAccelerator | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-TypeAccelerator | Should -Be 'Hello'
    }

}

# todo update Pester tests
