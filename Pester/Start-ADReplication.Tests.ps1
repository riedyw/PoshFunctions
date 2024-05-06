Describe "[Start-ADReplication] Tests" {

    It "Number" {
        Start-ADReplication | Should -Be 15
    }

    It "Boolean" {
        Start-ADReplication | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Start-ADReplication | Should -Be 'Hello'
    }

}

# todo update Pester tests
