Describe "[Stop-RecordSession] Tests" {

    It "Number" {
        Stop-RecordSession | Should -Be 15
    }

    It "Boolean" {
        Stop-RecordSession | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Stop-RecordSession | Should -Be 'Hello'
    }

}

# todo update Pester tests
