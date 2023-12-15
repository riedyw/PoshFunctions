function Get-DuplicateFileName {
    <#
.SYNOPSIS
    To find duplicate file names within a given folder
.DESCRIPTION
    To find duplicate file names within a given folder. Alias for function 'Get-DupeFileName'.
    Will run Get-ChildItem against the given path, groups them by filename, and finds those that have a count greater than 1
.PARAMETER Path
    Name of a folder. Defaults to $pwd
.EXAMPLE
    Get-DuplicateFileName -Path 'NonExistentFolder'

    Get-DuplicateFileName : Path [NonExistentFolder] does not exist
    At line:1 char:1
    + Get-DuplicateFileName -Path 'NonExistentFolder'
    + ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        + CategoryInfo          : NotSpecified: (:) [Write-Error], WriteErrorException
        + FullyQualifiedErrorId : Microsoft.PowerShell.Commands.WriteErrorException,Get-DuplicateFileName
.EXAMPLE
    Get-DuplicateFileName -Path 'TestFileName'

    Get-DuplicateFileName : Path [TestFileName] is not a folder
    At line:1 char:1
    + Get-DuplicateFileName -Path 'TestFileName'
    + ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        + CategoryInfo          : NotSpecified: (:) [Write-Error], WriteErrorException
        + FullyQualifiedErrorId : Microsoft.PowerShell.Commands.WriteErrorException,Get-DuplicateFileName
.EXAMPLE
    Get-DuplicateFileName -Path 'C:\Temp\TestFiles\'

    Assuming you have a single duplicate filename found in the folder 'C:\Temp\TestFiles\'
    Count Name                      Group
    ----- ----                      -----
        2 TestFile.txt              {@{Name=TestFile.txt; Directory=C:\Temp\TestFiles; LastWriteTime=9/21/2021 1:00:20 PM; LastWriteTimeUtc=9/21/2021 5:00:20 PM; Length=0; Ful...
.EXAMPLE
    Get-DuplicateFileName -Path 'C:\Temp\TestFiles\' | Select-Object -ExpandProperty Group


    Name             : TestFile.txt
    Directory        : C:\Temp\TestFiles
    LastWriteTime    : 9/21/2021 1:00:20 PM
    LastWriteTimeUtc : 9/21/2021 5:00:20 PM
    Length           : 0
    FullName         : C:\Temp\TestFiles\TestFile.txt

    Name             : TestFile.txt
    Directory        : C:\Temp\TestFiles\Folder
    LastWriteTime    : 9/21/2021 1:03:49 PM
    LastWriteTimeUtc : 9/21/2021 5:03:49 PM
    Length           : 38
    FullName         : C:\Temp\TestFiles\Folder\TestFile.txt
.NOTES
    Will return the following properties of each file:
        Name
        Directory
        LastWriteTimeUTC
        LastWriteTime
        Length
        FullName
#>

    [CmdletBinding(ConfirmImpact = 'None')]
    [alias('Get-DupeFileName')] #FunctionAlias
    param(
        [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string] $Path = $pwd
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        if (-not (Test-Path -Path $Path)) {
            Write-Error -Message "Path [$Path] does not exist"
        } elseif (-not (Get-Item -Path $Path).PsIsContainer) {
            Write-Error -Message "Path [$Path] is not a folder"
        } else {
            $File = Get-ChildItem -Path $Path -File -Recurse | Select-Object -Property Name, Directory, LastWriteTime, LastWriteTimeUTC, Length, FullName
            $Group = $File | Group-Object -Property Name
            $Group | Where-Object { $_.Count -gt 1 }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
