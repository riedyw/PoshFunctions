Describe "[Test-IsLocalIPv4] Tests" {

    It "Local" {
        Test-IsLocalIPv4 -Source 10.100.10.20 -SubnetMask 255.255.255.0 -Target 10.100.10.30 | Should -Be $true
    }

    It "Remote" {
        Test-IsLocalIPv4 -Source 10.100.10.20 -SubnetMask 255.255.255.0 -Target 10.100.20.30 | Should -Be $false
    }

}
