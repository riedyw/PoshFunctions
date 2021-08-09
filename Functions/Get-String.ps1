function Get-String {
    <#
.SYNOPSIS
    Returns a string given an indeterminate number of command line arguments.
.DESCRIPTION
    Returns a string given an indeterminate number of command line arguments.
.EXAMPLE
    $String = Get-String Hello   World 1

    Creates a variable containing the string 'Hello World 1'
.NOTES
    Source Windows PowerShell in Action, 2nd edition, page 239, function qs
#>

    "$args"
}
