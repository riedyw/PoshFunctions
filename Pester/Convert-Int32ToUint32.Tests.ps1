Describe "[Convert-Int32ToUint32] Tests" {

    It 'Negative number' {
        $Number = -1
        $Result = [uint32] 4294967295
        Convert-Int32ToUint32 -Number $Number | Should -Be $Result
    }

    It 'Positive number' {
        $Number = 128
        $Result = [uint32] 128
        Convert-Int32ToUint32 -Number $Number | Should -Be $Result
    }

}
