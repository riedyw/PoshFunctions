
Describe "ConvertTo-Hex Tests" {

    It "Number" {
        ConvertTo-Hex -Number 23 | Should -Be '17'
    }

    It "Pipeline" {
        32 | ConvertTo-Hex | Should -Be '20'
    }

    It "Prefix #" {
        ConvertTo-Hex -Number 128 -Prefix '#' -MinimumWidth 6 | Should -Be '#000080'
    }


    It "Prefix 0X" {
        ConvertTo-Hex -Number 255 -Prefix '0x' | Should -Be '0xff'
    }

    It "IncludeInput" {
        $Expected = New-Object -TypeName psobject -Property ([ordered] @{
                        Number = 65
                        Hex = '41'
                })
        $Actual = ConvertTo-Hex -Number 65 -IncludeInput
        $Actual.Number | Should -Be $Expected.Number
        $Actual.Hex | Should -Be $Actual.Hex
    }


}
