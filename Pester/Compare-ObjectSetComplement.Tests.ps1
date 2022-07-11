Describe "[Compare-ObjectSetComplement] Tests" {

    It "Case insensitive" {
        Compare-ObjectSetComplement -ReferenceObject a,b,c -DifferenceObject a,c | Should -Be 'b'
    }

    It "Case sensitive" {
        Compare-ObjectSetComplement -ReferenceObject a,b,c -DifferenceObject a,b,C -CaseSensitive | Should -Be 'c'
    }

    It "Null" {
        Compare-ObjectSetComplement -ReferenceObject a,b,c -DifferenceObject a,b,c,D | Should -Be $null
    }

}
