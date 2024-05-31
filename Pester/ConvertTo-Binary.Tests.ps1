Describe "[ConvertTo-Binary] Tests" {

    It "Named Parameter" {
        ConvertTo-Binary -Number 7 | Should -Be '111'
        ConvertTo-Binary -Number 64 | Should -Be '1000000'
        ConvertTo-Binary -Number 64 -Width 12 | Should -Be '000001000000'
    }

    It "Positional" {
        ConvertTo-Binary 7 | Should -Be '111'
        ConvertTo-Binary 64 | Should -Be '1000000'
        ConvertTo-Binary 64 -Width 12 | Should -Be '000001000000'
    }

    It "Pipeline" {
        7 | ConvertTo-Binary | Should -Be '111'
        64 | ConvertTo-Binary | Should -Be '1000000'
        64 | ConvertTo-Binary -Width 12 | Should -Be '000001000000'
    }

}
