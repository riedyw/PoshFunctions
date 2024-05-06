Describe "[Compare-ObjectSetIntersection] Tests" {

    It 'Single item' {
        Compare-ObjectSetIntersection -ReferenceObject a,b,c -DifferenceObject a,B,C -CaseSensitive  | Should -Be 'a'
    }

    It 'Null' {
        Compare-ObjectSetIntersection -ReferenceObject a,b,c -DifferenceObject d,e,f | Should -Be $null
    }

}
