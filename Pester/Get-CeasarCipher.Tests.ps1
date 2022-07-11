Describe "[Get-CeasarCipher] Tests" {

    It "Number" {
        Get-CeasarCipher | Should -Be 15
    }

    It "Boolean" {
        Get-CeasarCipher | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Get-CeasarCipher | Should -Be 'Hello'
    }

}

# todo update Pester tests
