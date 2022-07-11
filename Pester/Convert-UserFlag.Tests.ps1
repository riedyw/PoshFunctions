Describe "[Convert-UserFlag] Tests" {

    It "Decimal" {
        Convert-UserFlag -UserFlag 528 | Should -Be 'ACCOUNTENABLE,LOCKOUT,NORMAL_ACCOUNT'
    }

    It "Hex" {
        Convert-UserFlag -UserFlag (0x0200 + 0x0010 + 0x800000) | Should -Be 'ACCOUNTENABLE,LOCKOUT,NORMAL_ACCOUNT,PASSWORD_EXPIRED'
    }

    It "Pipeline" {
        2 | Convert-UserFlag | Should -Be 'NOT_LOCKOUT,ACCOUNTDISABLE'
    }

}
