Describe "[Test-IsNull] Tests" {

    It "Nulls" {
        Test-IsNull | Should -BeTrue
        Test-IsNull $null | Should -BeTrue
        Test-IsNull '' | Should -BeTrue
    }

    It "Non-nulls" {
        Test-IsNull $true | Should -BeFalse
        Test-IsNull $false | Should -BeFalse
        Test-IsNull 'string' | Should -BeFalse
        Test-IsNull 0 | Should -BeFalse
    }

}
