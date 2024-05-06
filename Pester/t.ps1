describe 'blah' { 
    beforeall {
        $TestPath = 'TestDrive:\test.txt'
        Set-Content $testPath -value "my test text."
    }

    context 'innerblah' { 
        it 'exists' { 
            '.\PoshFunctions.Module.Tests.ps1' | should -exist 
        }
        
        it 'testdrive:' {
            write-warning (get-item $TestPath).Fullname
            write-warning (resolve-path $TestPath)
            $true | Should -Be $true
        }
    }
}
# todo update Pester tests
