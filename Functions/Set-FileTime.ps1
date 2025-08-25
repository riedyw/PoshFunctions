function Set-FileTime {
<#
.SYNOPSIS
    A function to change the file time properties: LastWriteTime, LastAccessTime, CreationTime
.DESCRIPTION
    A function to change the file time properties: LastWriteTime, LastAccessTime, CreationTime
.PARAMETER Path
    Path to a file
.PARAMETER CreationTime
    Date to set the CreationTime property to
.PARAMETER LastAccessTime
    Date to set the LastAccessTime property to
.PARAMETER LastWriteTime
    Date to set the LastWriteTime property to
.EXAMPLE
    Test-MyTestFunction -Verbose
    Explanation of the function or its result. You can include multiple examples with additional .EXAMPLE lines
#>


    [CmdletBinding(DefaultParameterSetName = 'ByPipeline')]
    param (
        # [Parameter(Mandatory, Position = 0, ParameterSetName = 'ByName')]
        # [string]$FullName,

        [Parameter(Mandatory, ValueFromPipeline = $true, ParameterSetName = 'ByPipeline')]
        [string[]] $Path,

        [Parameter()]
        [datetime] $CreationTime,

        [Parameter()]
        [datetime]$LastAccessTime,

        [Parameter()]
        [datetime]$LastWriteTime
    )

    begin {

    }

    process {
        foreach ($item in $path) {
            $file = Get-Item -Path $item
            if (-not ($file -is [System.IO.FileInfo])) {
                Write-Error "Invalid input: Must be a file."
                return
            }
            if ($null -ne $CreationTime) {
                (Get-Item -LiteralPath $item).CreationTime = $CreationTime
            }
            if ($null -ne $LastAccessTime) {
                (Get-Item -LiteralPath $item).LastAccessTime = $LastAccessTime
            }
            if ($null -ne $LastWriteTime) {
                (Get-Item -LiteralPath $item).LastWriteTime = $LastWriteTime
            }
        }
    }

    end {

    }

}
