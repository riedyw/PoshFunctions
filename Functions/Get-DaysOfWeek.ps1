function Get-DaysOfWeek {
<#
.SYNOPSIS
    Gets the days of the week
.DESCRIPTION
    Gets the days of the week
.PARAMETER Short
    Switch that will return the short name of the days of the week
.NOTES
    Renamed from Show-DaysOfWeek and incorporated functionality of Show-ShortDaysOfWeek
#>

    [CmdletBinding(ConfirmImpact='None')]
    [Alias('Show-DaysOfWeek')] #FunctionAlias
    [OutputType([string[]])]
    param (
        [switch] $Short
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        if ($Short -and $PSBoundParameters.ContainsKey('Short')) {
            [System.Globalization.DateTimeFormatInfo]::CurrentInfo.AbbreviatedDayNames
        } else {
            [System.Globalization.DateTimeFormatInfo]::CurrentInfo.DayNames
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
