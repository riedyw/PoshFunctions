Describe "[Compare-ObjectSetUnion] Tests" {

    It 'Union case sensitive' {
        $Result = Compare-ObjectSetUnion -ReferenceObject a,b,c -DifferenceObject a,b,C -CaseSensitive
        $Result.Count | Should -Be 4
        ($Result -ccontains 'a') | Should -Be $true
        ($Result -ccontains 'b') | Should -Be $true
        ($Result -ccontains 'c') | Should -Be $true
        ($Result -ccontains 'C') | Should -Be $true
    }

    It 'Union case insensitive' {
        $Result = Compare-ObjectSetUnion -ReferenceObject a,b,c -DifferenceObject a,b,C
        $Result.Count | Should -Be 3
        ($Result -contains 'a') | Should -Be $true
        ($Result -contains 'b') | Should -Be $true
        ($Result -contains 'c') | Should -Be $true
    }

}
