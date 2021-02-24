function Show-ShortDaysOfWeek {
<#
.SYNOPSIS
    Show short days of the week
.DESCRIPTION
    Show short days of the week
#>

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
