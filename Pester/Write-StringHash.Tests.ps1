Describe "[Write-StringHash] Tests" {

    It "Number" {
        Write-StringHash | Should -Be 15
    }

    It "Boolean" {
        Write-StringHash | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Write-StringHash | Should -Be 'Hello'
    }

}

# todo update Pester tests
