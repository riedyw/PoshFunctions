Describe "[Write-StringArray] Tests" {

    It "Number" {
        Write-StringArray | Should -Be 15
    }

    It "Boolean" {
        Write-StringArray | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Write-StringArray | Should -Be 'Hello'
    }

}

# todo update Pester tests
