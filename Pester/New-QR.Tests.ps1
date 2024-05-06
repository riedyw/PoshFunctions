Describe "[New-QR] Tests" {

    It "Number" {
        New-QR | Should -Be 15
    }

    It "Boolean" {
        New-QR | Should -BeTrue
    }

    It "Pipeline" {
        "data" | New-QR | Should -Be 'Hello'
    }

}

# todo update Pester tests
