# Source: https://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e
# get-help about_ISE-Color-Theme-Cmdlets for more information

Function Import-GroupISETheme {
<#
.SYNOPSIS
    Describe purpose of "Import-GroupISETheme" in 1-2 sentences.

.DESCRIPTION
    Add a more complete description of what the function does.

.PARAMETER Directory
    Describe parameter -Directory.

.EXAMPLE
    Import-GroupISETheme -Directory Value
    Describe what this call does

.NOTES
    Place additional notes here.

.LINK
    URLs to related sites
    The first link is opened by Get-Help -Online Import-GroupISETheme

.INPUTS
    List of input types that are accepted by this function.

.OUTPUTS
    List of output types produced by this function.
#>


[CmdletBinding(ConfirmImpact='Low')]
    Param (
        [Parameter(Mandatory,HelpMessage='Add help message for user')] [ValidateNotNullOrEmpty()]
        [string] $Directory
    )

    get-childitem -Path $Directory -Filter *.ps1xml | select-object -property fullname | Import-ISEThemeFile
}
