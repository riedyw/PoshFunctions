Describe "[Out-PDFToPrinter] Tests" {

    It "Number" {
        Out-PDFToPrinter | Should -Be 15
    }

    It "Boolean" {
        Out-PDFToPrinter | Should -BeTrue
    }

    It "Pipeline" {
        "data" | Out-PDFToPrinter | Should -Be 'Hello'
    }

}

# todo update Pester tests
