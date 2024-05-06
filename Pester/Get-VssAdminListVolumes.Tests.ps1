Describe "[Get-VssAdminListVolumes] Tests" {

    It "Number" {
        Get-VssAdminListVolumes | Should -Be 15
    }

    It "Boolean" {
        Get-VssAdminListVolumes | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-VssAdminListVolumes | Should -Be 'Hello'
    }

}

# todo update Pester tests
