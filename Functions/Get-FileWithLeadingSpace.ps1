Function Get-FileWithLeadingSpace {
<#
.SYNOPSIS
    To find files that begin with a space character
.DESCRIPTION
    To find files that begin with a space character
.PARAMETER path
    The path where you want to begin looking
.EXAMPLE
    Get-FileWithLeadingSpace -path Value
    Describe what this call does

#>

    [CmdletBinding(ConfirmImpact='None')]
    Param([string] $path = 'c:\a')

    Get-ChildItem -Path $path -Recurse |
        foreach-object {
            if($_.name.length -ne $_.name.trim().length)
            {
                "$($_.basename) contains a leading space"
            }
        }
} #end function Get-FileWithLeadingSpace
