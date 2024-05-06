Describe "[Get-VssAdminListWriters] Tests" {

    It "Number" {
        Get-VssAdminListWriters | Should -Be 15
    }

    It "Boolean" {
        Get-VssAdminListWriters | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-VssAdminListWriters | Should -Be 'Hello'
    }

}

# todo update Pester tests
