Describe "[Show-Timezone] Tests" {

    It "Number" {
        Show-Timezone | Should -Be 15
    }

    It "Boolean" {
        Show-Timezone | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Show-Timezone | Should -Be 'Hello'
    }

}

# todo update Pester tests
