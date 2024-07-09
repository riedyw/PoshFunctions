function Remove-FileAttribute {
    <#
.SYNOPSIS
    Removes a file attribute from specified path (ReadOnly, Hidden, System, Archive)
.DESCRIPTION
    Removes a file attribute from specified path (ReadOnly, Hidden, System, Archive)
.PARAMETER Path
    A string, or string array, of path to file(s)
.PARAMETER FileAttribute
    A string, or string array, that represents file attributes. Valid entries are: (ReadOnly, Hidden, System, Archive)
.EXAMPLE
    (Get-Item -Path .\Control.ini).Attributes

    Archive

    Remove-FileAttribute -Path .\Control.ini -FileAttribute Archive

    (Get-Item -Path .\Control.ini).Attributes

    Normal
#>


    [cmdletbinding()]
    param (
        [parameter(Mandatory,HelpMessage='Please specify a file')]
        [validatescript({
            if (Test-MultipleBool -Bool ($_ | Foreach-Object { Test-Path -Path $_ }) -TestAnd) {
                $true
            } else {
                throw 'ERROR: File(s) specified must exist'
            }
        })]
        [string[]] $Path,

        [parameter(Mandatory,HelpMessage='Enter one or more of the following: [ReadOnly, Hidden, System, Archive]')]
        [validatescript({
            if (Test-MultipleBool -Bool ($_ | Foreach-Object { $_ -in @('ReadOnly', 'Hidden', 'System', 'Archive') }) -TestAnd) {
                $true
            } else {
                throw 'ERROR: The only valid options are: [ReadOnly, Hidden, System, Archive]'
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
                Write-Verbose "    removing attribute [$Attr]"
                $File.Attributes = $File.Attributes -band (-bnot [System.IO.FileAttributes]::$Attr)
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
