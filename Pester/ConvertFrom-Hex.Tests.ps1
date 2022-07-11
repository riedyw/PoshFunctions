Describe "[ConvertFrom-Hex] Tests" {

    It "Number" {
        ConvertFrom-Hex -Hex 'f0' | Should -Be 240
    }

    It "Multiple numbers" {
        $Result = ConvertFrom-Hex -Hex '0xff','20' -IncludeInput
        $Result.Count | Should -Be 2
        $Result[0].Number | Should -Be 255
        $Result[1].Number | Should -Be 32
    }

    It "Pipeline" {
        "21" | ConvertFrom-Hex | Should -Be 33
    }

}
