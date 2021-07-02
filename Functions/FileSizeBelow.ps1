filter FileSizeBelow {
<#
.SYNOPSIS
    To use as a filter against Get-ChildItem
.DESCRIPTION
    To use as a filter against Get-ChildItem
.PARAMETER Size
    The maximum size a file can be
.EXAMPLE
    Assume I have 1 small file in c:\temp, and many larger files.

    dir c:\temp -File | FileSizeBelow -Size 1KB | Select-Object FullName, LastWriteTime, Length

    FullName        LastWriteTime        Length
    --------        -------------        ------
    C:\temp\log.log 12/8/2019 9:55:07 PM    186
.NOTES
    Could NOT make this an advanced function
#>


    param
    (
        [int] $Size
    )

    if ($_.length -le $Size) {
        $_
    }
}
