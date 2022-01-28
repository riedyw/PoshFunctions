function Get-FileWithLeadingSpace {
<#
.SYNOPSIS
    To find files that begin with a space character
.DESCRIPTION
    To find files that begin with a space character
.PARAMETER Path
    The path where you want to begin looking
.EXAMPLE
    Get-FileWithLeadingSpace -path Value
    Describe what this call does

#>

    [CmdletBinding(ConfirmImpact='None')]
    Param([string] $Path=$PWD)

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        Get-ChildItem -Path $Path -Recurse -ErrorAction SilentlyContinue |
        foreach-object {
            if ($_.name.length -ne $_.name.trim().length) {
                Write-Output -InputObject $_.FullName
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
