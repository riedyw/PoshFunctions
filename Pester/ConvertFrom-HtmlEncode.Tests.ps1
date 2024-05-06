Describe "[ConvertFrom-HtmlEncode] Tests" {

    It "String" {
        ConvertFrom-HTMLEncode -HTML '&amp;' | Should -Be '&'
    }

    It "Longer string" {
        ConvertFrom-HTMLEncode -HTML '&apos;Hello World&apos;' | Should -Be "'Hello World'"
    }

    It "Pipeline" {
        '&apos;Hello World&apos;' | ConvertFrom-HtmlEncode | Should -Be "'Hello World'"
    }

    It "Multiple" {
        $Result = ConvertFrom-HTMLEncode -HTML 'It&#39;s a shame, that&#39;s my 2 cents', '&lt;h2&gt;' -IncludeInput
        $Result.Count | Should -Be 2
        $Result[0].PlainText | Should -Be "It's a shame, that's my 2 cents"
        $Result[1].PlainText | Should -Be '<h2>'
    }
}
