function Show-ShortMonth {
<#
.SYNOPSIS
    Shows short month
.DESCRIPTION
    Shows short month
#>

# rename Get-ShortAllMonths, function alias, readme

    [CmdletBinding(ConfirmImpact='None')]
    Param ()

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        [System.Globalization.DateTimeFormatInfo]::CurrentInfo.AbbreviatedMonthNames
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
