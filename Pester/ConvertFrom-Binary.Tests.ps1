Describe "[ConvertFrom-Binary] Tests" {

    It "Positional" {
        ConvertFrom-Binary 100001 | Should -Be 33
    }

    It "Named" {
        ConvertFrom-Binary -Binary 1000001 | Should -Be 65
    }

    It "Multiple values, include input" {
        $Result = ConvertFrom-Binary -Binary 11111, 11110 -IncludeInput
        $Result.Count | Should -Be 2
        $Result[0].Number | Should -Be 31
        $Result[1].Number | Should -Be 30
    }

    It "Pipeline" {
        10000011 | ConvertFrom-Binary | Should -Be 131
    }

}
