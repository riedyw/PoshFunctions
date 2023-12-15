function Show-ShortDaysOfWeek {
<#
.SYNOPSIS
    Show short days of the week
.DESCRIPTION
    Show short days of the week
#>

# todo rename Get-ShortDaysOfWeek, function alias, update readme

    [CmdletBinding(ConfirmImpact='None')]
    Param ()

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        [System.Globalization.DateTimeFormatInfo]::CurrentInfo.AbbreviatedDayNames
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
