Describe "[Get-MyLocalLogonTime] Tests" {

    It "ReturnType" {
        (Get-MyLocalLogonTime) -is [datetime] | Should -BeTrue
    }

}
