Describe "[Start-RecordSession] Tests" {

    It "Number" {
        Start-RecordSession | Should -Be 15
    }

    It "Boolean" {
        Start-RecordSession | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Start-RecordSession | Should -Be 'Hello'
    }

}

# todo update Pester tests
