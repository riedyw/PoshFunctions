function Get-Months {
<#
.SYNOPSIS
    Gets the months
.DESCRIPTION
    Gets the months
.PARAMETER Short
    Switch to show the short names as opposed to the full names of the months
#>

    [CmdletBinding(ConfirmImpact='None')]
    [Alias('ShowMonth')] #FunctionAlias
    param (
        [switch] $Short
    )
    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        if ($Short -and $PSBoundParameters.ContainsKey('Short')) {
            [System.Globalization.DateTimeFormatInfo]::CurrentInfo.AbbreviatedMonthNames
        } else {
            [Globalization.DatetimeFormatInfo]::CurrentInfo.MonthNames
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
