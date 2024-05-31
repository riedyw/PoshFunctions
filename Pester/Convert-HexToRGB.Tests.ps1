Describe '[Convert-HexToRGB] Tests' {

    It 'RGB string' {
        $Result = Convert-HexToRGB -Hex '808080'
        $Result | Should -Be '128, 128, 128'
    }

    It 'Include input' {
        $Result = Convert-HexToRGB -Hex '#ffff80' -IncludeInput
        $Result.Hex | Should -Be '#ffff80'
        $Result.Red | Should -Be 255
        $Result.Green | Should -Be 255
        $Result.Blue | Should -Be 128
    }

}
