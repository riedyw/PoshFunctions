Describe "[Convert-Int64ToText] Tests" {

    It 'Ones' {
        $Number = 7
        $Expected = 'Seven'
        $Result = Convert-Int64ToText -Number $Number
        $Result | Should -Be $Expected
    }

    It 'Teens' {
        $Number = 13
        $Expected = 'Thirteen'
        $Result = Convert-Int64ToText -Number $Number
        $Result | Should -Be $Expected
    }

    It 'Hundreds' {
        $Number = 249
        $Expected = 'Two Hundred Forty Nine'
        $Result = Convert-Int64ToText -Number $Number
        $Result | Should -Be $Expected
    }

    It 'Thousands' {
        $Number = 15835
        $Expected = 'Fifteen Thousand Eight Hundred Thirty Five'
        $Result = Convert-Int64ToText -Number $Number
        $Result | Should -Be $Expected
    }

    It 'Millions' {
        $Number = 6543123
        $Expected = 'Six Million Five Hundred Forty Three Thousand One Hundred Twenty Three'
        $Result = Convert-Int64ToText -Number $Number
        $Result | Should -Be $Expected
    }

    It 'Pipeline' {
        $Number = 6
        $Expected = 'Six'
        $Result = $Number | Convert-Int64ToText
        $Result | Should -Be $Expected
    }

}
