Describe "[ConvertTo-Bool] Tests" {

    It "Named Parameter" {
        ConvertTo-Bool -InputVal 'true' | Should -Be $true
        ConvertTo-Bool -InputVal 't' | Should -Be $true
        ConvertTo-Bool -InputVal 'yes' | Should -Be $true
        ConvertTo-Bool -InputVal 'y' | Should -Be $true
        ConvertTo-Bool -InputVal 'on' | Should -Be $true
        ConvertTo-Bool -InputVal 'enabled' | Should -Be $true
        ConvertTo-Bool -InputVal 'false' | Should -Be $false
        ConvertTo-Bool -InputVal 'garbage' | Should -Be $false
    }

    It "Positional Parameter" {
        ConvertTo-Bool 'true' | Should -Be $true
        ConvertTo-Bool 't' | Should -Be $true
        ConvertTo-Bool 'yes' | Should -Be $true
        ConvertTo-Bool 'y' | Should -Be $true
        ConvertTo-Bool 'on' | Should -Be $true
        ConvertTo-Bool 'enabled' | Should -Be $true
        ConvertTo-Bool 'false' | Should -Be $false
        ConvertTo-Bool 'garbage' | Should -Be $false
    }

    It "Pipeline" {
        'true' | ConvertTo-Bool | Should -Be $true
        't' | ConvertTo-Bool | Should -Be $true
        'yes' | ConvertTo-Bool | Should -Be $true
        'y' | ConvertTo-Bool | Should -Be $true
        'on' | ConvertTo-Bool | Should -Be $true
        'enabled' | ConvertTo-Bool | Should -Be $true
        'false' | ConvertTo-Bool | Should -Be $false
        'garbage' | ConvertTo-Bool | Should -Be $false
    }

    It "TrueString" {
        ConvertTo-Bool -InputVal 'true' -TrueString 'false', 'garbage' | Should -Be $false
        ConvertTo-Bool -InputVal 't' -TrueString 'false', 'garbage' | Should -Be $false
        ConvertTo-Bool -InputVal 'yes' -TrueString 'false', 'garbage' | Should -Be $false
        ConvertTo-Bool -InputVal 'y' -TrueString 'false', 'garbage' | Should -Be $false
        ConvertTo-Bool -InputVal 'on' -TrueString 'false', 'garbage' | Should -Be $false
        ConvertTo-Bool -InputVal 'enabled' -TrueString 'false', 'garbage' | Should -Be $false
        ConvertTo-Bool -InputVal 'false' -TrueString 'false', 'garbage' | Should -Be $true
        ConvertTo-Bool -InputVal 'garbage' -TrueString 'false', 'garbage' | Should -Be $true
    }

}
