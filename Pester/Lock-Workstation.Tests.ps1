Describe "[Lock-Workstation] Tests" {

    It "Number" {
        Lock-Workstation | Should -Be 15
    }

    It "Boolean" {
        Lock-Workstation | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Lock-Workstation | Should -Be 'Hello'
    }

}

# todo update Pester tests
