Describe "[Get-ArpTable] Tests" {

    It "Number" {
        Get-ArpTable | Should -Be 15
    }

    It "Boolean" {
        Get-ArpTable | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-ArpTable | Should -Be 'Hello'
    }

}

# todo update Pester tests
