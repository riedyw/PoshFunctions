Describe "[Write-TextMenu] Tests" {

    It "Number" {
        Write-TextMenu | Should -Be 15
    }

    It "Boolean" {
        Write-TextMenu | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Write-TextMenu | Should -Be 'Hello'
    }

}

# todo update Pester tests
