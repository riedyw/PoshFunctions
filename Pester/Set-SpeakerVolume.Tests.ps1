Describe "[Set-SpeakerVolume] Tests" {

    It "Number" {
        Set-SpeakerVolume | Should -Be 15
    }

    It "Boolean" {
        Set-SpeakerVolume | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Set-SpeakerVolume | Should -Be 'Hello'
    }

}

# todo update Pester tests
