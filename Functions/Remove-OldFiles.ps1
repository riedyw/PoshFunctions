function Remove-OldFiles {
<#
.SYNOPSIS
    Keeps the newest set of files in a path that match a pattern and deletes the rest
.DESCRIPTION
    Keeps the newest set of files in a path that match a pattern and deletes the rest
.PARAMETER Path
    The path of where to search for the FileSpec. Mandatory
.PARAMETER FileSpec
    The file specification to search for. Most likely will include wildcards so that more than 1 file will be found. Mandatory
.PARAMETER Count
    Integer representing the number of newest files that will be kept, and the remainder deleted. Validate between 1-100, default being 7.
.EXAMPLE
    Remove-OldFiles -Path 'C:\Windows\System32\WinEvt\Logs' -FileSpec 'Archive-System-*.evtx' -Count 30

    It will search 'C:\Windows\System32\WinEvt\Logs' for files matching the wildcard 'Archive-System-*.evtx', keep the most recent 30 and delete the rest
#>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory, HelpMessage = 'Enter the path you want to search. Ex [C:\Windows\System32\WinEvt\Logs]')]
        [string] $Path,

        [Parameter(Mandatory, HelpMessage = 'Enter the file specification. Ex [Archive-System-*.evtx]')]
        [string] $FileSpec,

        [ValidateRange(1, 100)]
        [int] $Count = 7
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        # Search for the files in the path matching the file spec
        $Files = Get-ChildItem -Path $Path -Filter $FileSpec -File |
        Sort-Object -Property LastWriteTime -Descending

        # Write-Verbose statement to show number of files found
        Write-Verbose -Message "Found $($Files.Count) files matching '$FileSpec' in '$Path'."

        # If there are fewer or equal files than the count to keep, do nothing
        if ($Files.Count -le $Count) {
            Write-Verbose -Message "There are $($Files.Count) files, which is less than or equal to the retention count of $Count. No files will be deleted."
            return
        }

        # Files to delete: Skip the first $Count files and delete the rest
        $FilesToDelete = $Files | Select-Object -Skip $Count

        # Write-Verbose statement to list files to be deleted
        Write-Verbose -Message "Deleting $($FilesToDelete.Count) files."

        # Remove the files
        foreach ($File in $FilesToDelete) {
            Write-Verbose -Message "Removing file: $($File.FullName)"
            Remove-Item -Path $File.FullName -Force
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
