Describe "[Compare-ObjectSetDifference] Tests" {

    It 'Case insensitive' {
        Compare-ObjectSetDifference -ReferenceObject a,b,c -DifferenceObject a,c | Should -Be 'b'
    }

    It 'Case sensitive' {
        Compare-ObjectSetDifference -ReferenceObject a,b,c -DifferenceObject a,b,C -CaseSensitive | Should -Be 'c'
    }

    It 'Same sets' {
        Compare-ObjectSetDifference -ReferenceObject a,b,c -DifferenceObject b,C,a | Should -Be $null
    }

}
