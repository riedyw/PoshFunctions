function Add-FileAttribute {
    # todo add CommentHelp
    [cmdletbinding()]
    param (
        [parameter(Mandatory,HelpMessage='Please specify a file')]
        [validatescript({
            if (Test-MultipleBool -Bool ($_ | Foreach-Object { Test-Path -Path $_ }) -TestAnd) {
                $true
            } else {
                throw 'File(s) specified must exist'
            }
        })]
        [string[]] $Path,
        
        [parameter(Mandatory,HelpMessage='Enter one or more of the following: [ReadOnly, Hidden, System, Archive]')]
        [validatescript({
            if (Test-MultipleBool -Bool ($_ | Foreach-Object { $_ -in @('ReadOnly', 'Hidden', 'System', 'Archive') }) -TestAnd) {
                $true
            } else {
                throw 'The only valid options are: [ReadOnly, Hidden, System, Archive]'
            }
        })]
        [string[]] $FileAttribute
    )
    
    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process { 
        foreach ($File in $Path) {
            Write-Verbose "Processing file [$File]"
            $File = Get-Item -Path $File -Force
            foreach ($Attr in $FileAttribute) {
                $Attr = @('ReadOnly', 'Hidden', 'System', 'Archive') | where-object { $_ -eq $Attr }
                Write-Verbose "    adding attribute [$Attr]"
                $File.Attributes = $File.Attributes -bor [System.IO.FileAttributes]::$Attr
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
