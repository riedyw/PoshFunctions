BeforeAll {
    $ModuleName = 'PoshFunctions'
    Import-Module -Name (Resolve-Path -Path "$PSScriptRoot\..\PoshFunctions.psm1") -Force
    $Manifest = Import-PowerShellDataFile -Path (Resolve-Path -Path "$PSScriptRoot\..\PoshFunctions.psd1").Path
    $FileCount = (Get-ChildItem -Path (Join-Path (Resolve-Path -Path "$PSScriptRoot\..\Functions") -ChildPath '*.ps1') -File).count
}


Describe "$ModuleName Module Tests" {

    It "Has the root module [$ModuleName.psm1]" {
        $ModulePath = Join-Path -Path (Resolve-path -Path "$PSScriptRoot\..") -ChildPath "PoshFunctions.psm1"
        $ModulePath | Should -Exist
    }

    It "Has the a manifest file of [$ModuleName.psd1]" {
        $ManifestPath = Join-Path -Path (Resolve-path -Path "$PSScriptRoot\..") -ChildPath "PoshFunctions.psd1"
        $ManifestPath | Should -Exist
    }

    It "$ModuleName folder has Functions subfolder" {
        (Resolve-Path -Path "$PSScriptRoot\..\Functions").Path | Should -Exist
    }

    It "$ModuleName folder has Docs subfolder" {
        (Resolve-Path -Path "$PSScriptRoot\..\Docs").Path | Should -Exist
    }

    It "$ModuleName folder has Resources subfolder" {
        (Resolve-Path -Path "$PSScriptRoot\..\Resources").Path | Should -Exist
    }

    It "Exported functions count" {
        # $true | Should -BeTrue
        $Manifest.FunctionsToExport.Count | Should -Be $FileCount
    }

}
