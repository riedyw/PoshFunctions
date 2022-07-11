Describe "[Remove-TeamsCache] Tests" {

    It "Number" {
        Remove-TeamsCache | Should -Be 15
    }

    It "Boolean" {
        Remove-TeamsCache | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Remove-TeamsCache | Should -Be 'Hello'
    }

}

# todo update Pester tests
