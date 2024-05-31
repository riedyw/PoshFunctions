Describe "[Compare-PSGalleryObject] Tests" {

    It "Number" {
        Compare-PSGalleryObject | Should -Be 15
    }

    It "Boolean" {
        Compare-PSGalleryObject | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Compare-PSGalleryObject | Should -Be 'Hello'
    }

}

# todo pester tests
