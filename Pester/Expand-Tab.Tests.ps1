Describe "[Expand-Tab] Tests" {

    It "Named Parameter" {
        Expand-Tab -InputString "`t" | Should -Be (' ' * 8)
        Expand-Tab -InputString "`t" -TabWidth 4 | Should -Be (' ' * 4)
    }

    It "Positional" {
        Expand-Tab "`t" | Should -Be (' ' * 8)
        Expand-Tab "`t" -TabWidth 4 | Should -Be (' ' * 4)
    }

    It "Pipeline" {
        "`t" | Expand-Tab | Should -Be (' ' * 8)
        "`t" | Expand-Tab -TabWidth 4 | Should -Be (' ' * 4)
    }

}
