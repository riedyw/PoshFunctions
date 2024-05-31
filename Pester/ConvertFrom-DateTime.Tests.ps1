Describe "[ConvertFrom-DateTime] Tests" {
    BeforeAll {
        $UTCDate = [datetime]::new(2022,03,27,13,45,17,[System.DateTimeKind]::UTC)
        $LocalDate = [datetime]::new(2022,03,27,13,45,17,[System.DateTimeKind]::Local)
    }

    It "Unix" {
        ConvertFrom-DateTime -Date $UTCDate -Unix | Should -Be 1648388717
    }

    It "DMTF" {
        ConvertFrom-DateTime -Date $UTCDate -DMTF | Should -Be '20220327134517.000000+000'
    }

    It "FileTime" {
        ConvertFrom-DateTime -Date $UTCDate -FileTime | Should -Be 132928623170000000
    }

    It "ICSDateTime" {
        ConvertFrom-DateTime -Date $UTCDate -ICSDateTime | Should -Be '20220327T134517'
    }

    It "ISO8601" {
        ConvertFrom-DateTime -Date $UTCDate -ISO8601 | Should -Be '2022.03.27T13:45:17'
    }

    It "Excel" {
        $Expected = ([math]::round(([double] 44645.5731134259),8))
        $Result = ([math]::round((ConvertFrom-DateTime -Date $UTCDate -Excel),8))
        $Result | Should -Be $Expected
    }

    It "Pipeline Unix" {
        $UTCDate | ConvertFrom-DateTime -Unix | Should -Be 1648388717
    }
}
