function Move-ToRecycleBin {
<#
.SYNOPSIS
    Instead of outright deleting a file, why not move it to the Recycle Bin?
.DESCRIPTION
    Instead of outright deleting a file, why not move it to the Recycle Bin?
    Function aliased to 'Recycle'
.PARAMETER Path
    A string or array of strings representing a file or a folder. Wildcards are
    acceptable and will be resolved to specific file or folder names. Can accept
    values from the pipeline.
.EXAMPLE
    Move-ToRecycleBin -Path c:\temp\dummyfile.txt -Verbose

    VERBOSE: Moving 'c:\temp\dummyfile.txt' to the Recycle Bin
.EXAMPLE
    Move-ToRecycleBin -Path c:\temp\dummyfile2.txt

    Would move c:\temp\dummyfile2.txt to the Recycle Bin
.EXAMPLE
    Move-ToRecycleBin .\FileDoesNotExist

    Move-ToRecycleBin : ERROR: Path [.\FileDoesNotExist] does not exist
.EXAMPLE
    Move-ToRecycleBin -Path 'File1.txt', 'File2.txt'

    Would move both File1.txt and File2.txt to the Recycle Bin
#>

    [CmdletBinding(ConfirmImpact = 'Medium')]
    [alias('Recycle')] #FunctionAlias
    param (
        [Parameter(Mandatory, HelpMessage='Please enter a path to a file or folder. Wildcards accepted.', ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string[]] $Path
    )

    begin {
        $FileSystem = New-Object -TypeName 'Microsoft.VisualBasic.FileIO.FileSystem'
        Write-Verbose -Message "Starting [$($MyInvocation.MyCommand)]"
    }

    process {
        foreach ($currentPath in $Path) {
            if (Test-Path -Path $currentPath) {
                $File = Resolve-Path -Path $currentPath
                foreach ($currentFile in $File) {
                    Write-Verbose -Message ("Moving '{0}' to the Recycle Bin" -f $currentFile)
                    if (Test-Path -Path $currentFile -PathType Container) {
                        $FileSystem::DeleteDirectory($currentFile, 'OnlyErrorDialogs', 'SendToRecycleBin')
                    } else {
                        $FileSystem::DeleteFile($currentFile, 'OnlyErrorDialogs', 'SendToRecycleBin')
                    }
                }
            } else {
                Write-Error -Message "ERROR: Path [$currentPath] does not exist"
            }
        }
    }

    end {
        Remove-Variable -Name FileSystem
        Write-Verbose -Message "Ending [$($MyInvocation.MyCommand)]"
    }
}
