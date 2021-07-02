filter FileSizeAbove {
<#
.SYNOPSIS
    To use as a filter against Get-ChildItem
.DESCRIPTION
    To use as a filter against Get-ChildItem
.PARAMETER Size
    The minimum size a file can be
.EXAMPLE
    Assume I have 1 large file in c:\temp, and many smaller files.

    dir c:\temp | FileSizeAbove -Size 1GB | Select-Object FullName, LastWriteTime, Length

    FullName            LastWriteTime            Length
    --------            -------------            ------
    C:\temp\install.wim 3/5/2020 11:39:23 AM 4314799742
.NOTES
    Could NOT make this an advanced function
#>


    param
    (
        [int] $Size
    )

    if ($_.Length -ge $Size) {
            $_
    }

}
