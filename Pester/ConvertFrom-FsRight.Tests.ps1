Describe "[ConvertFrom-FsRight] Tests" {

    It "Single return" {
        ConvertFrom-FsRight -Rights 268435456 | Should -Be 'GenericAll'
    }

    It "Multiple return" {
        ConvertFrom-FsRight -Rights "0x1301BF" | Should -Be 'ReadAndExecute,Modify,Write'
    }

    It "Multiple Rights" {
        $Result = ConvertFrom-FsRight -Rights "0x1301BF", 268435456 -IncludeInput
        $Result.Count | Should -Be 2
        $Result[0].RightString | Should -Be 'ReadAndExecute,Modify,Write'
        $Result[1].RightString | Should -Be 'GenericAll'
    }

    It "Pipeline" {
        268435456 | ConvertFrom-FsRight | Should -Be 'GenericAll'
    }

}
