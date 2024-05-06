Describe "[Get-BinaryType] Tests" {

    It "Number" {
        Get-BinaryType | Should -Be 15
    }

    It "Boolean" {
        Get-BinaryType | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-BinaryType | Should -Be 'Hello'
    }

}

# todo update Pester tests
