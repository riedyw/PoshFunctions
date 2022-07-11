Describe "[ConvertFrom-Base64] Tests" {

    It "Text" {
        ConvertFrom-Base64 'SABlAGwAbABvAA==' | Should -BeLikeExactly 'Hello'
    }

    It "Pipeline" {
        'VABoAGkAcwAgAGkAcwAgAGEAIABzAGUAYwByAGUAdAA=' | ConvertFrom-Base64 | Should -BeLikeExactly 'This is a secret'
    }

}
