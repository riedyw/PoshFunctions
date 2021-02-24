function Test-IsFileLocked {
<#
.SYNOPSIS
    Determine if a file is locked.
.DESCRIPTION
    Determine if a file is locked. Wildcards are acceptable in the path and are
    resolved to all files that match the pattern.
.PARAMETER Path
    A string or array of strings representing a path to a file. Can accept from the pipeline.
.EXAMPLE
    Test-IsFileLocked -Path c:\temp\*.csv

    File                      IsLocked
    ----                      --------
    C:\temp\Encoding Time.csv    False
    C:\temp\Test.csv             False
.EXAMPLE
    Test-IsFileLocked -Path .

    Test-IsFileLocked : ERROR: Path [.] is a folder
.EXAMPLE
    Test-IsFileLocked -Path .\FileDoesNotExist

    Test-IsFileLocked : ERROR: Path [.\FileDoesNotExist] does not exist
.NOTES
    # inspired by https://mcpmag.com/articles/2018/07/10/check-for-locked-file-using-powershell.aspx
    # changed logic for testing if file exists

#>

    [CmdletBinding(ConfirmImpact='None')]
    [OutputType([psobject[]])]
    Param (
        [parameter(Mandatory,HelpMessage='Please enter a path to a file',ValueFromPipeline,ValueFromPipelineByPropertyName)]
        [Alias('FullName','PSPath')]
        [string[]]$Path
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($Item in $Path) {
            if (Test-Path -Path $Item) {
                if (Test-Path -Path $Item -PathType Container) {
                    Write-Error -Message "ERROR: Path [$Item] is a folder"
                } else {
                    $Files = Convert-Path -Path $Item
                    foreach ($File in $Files) {
                        Try {
                            $FileStream = [System.IO.File]::Open($File,'Open','Write')
                            $FileStream.Close()
                            $FileStream.Dispose()
                            $IsLocked = $False
                        } Catch [System.UnauthorizedAccessException] {
                            $IsLocked = 'AccessDenied'
                        } Catch {
                            $IsLocked = $True
                        }
                        [pscustomobject]@{
                            File = $File
                            IsLocked = $IsLocked
                        }
                    }
                }
            } else {
                Write-Error -Message "ERROR: Path [$Item] does not exist"
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
