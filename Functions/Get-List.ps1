function Get-List {
    <#
.SYNOPSIS
    Returns an array given an indeterminate number of command line arguments.
.DESCRIPTION
    Returns an array given an indeterminate number of command line arguments.
.EXAMPLE
    $Colors = Get-List blue red green

    Creates an array of 3 string elements: 'blue', 'red', 'green'
.NOTES
    Source Windows PowerShell in Action, 2nd edition, page 239, function ql
#>

    $args
}
