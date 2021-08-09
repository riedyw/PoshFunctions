function Show-DaysOfWeek {
<#
.SYNOPSIS
    Shows the days of the week
.DESCRIPTION
    Shows the days of the week
.OUTPUTS
    [string[]]
#>

    [CmdletBinding(ConfirmImpact='None')]
    [OutputType([string[]])]
    Param ()

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        [System.Globalization.DateTimeFormatInfo]::CurrentInfo.DayNames
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
