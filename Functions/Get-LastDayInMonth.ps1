function Get-LastDayInMonth {
<#
.SYNOPSIS
    Get the last day of the month given the year as an integer, and the month as an integer
.DESCRIPTION
    Get the last day of the month given the year as an integer, and the month as an integer
.PARAMETER Year
    Integer in the range 1-9999, mandatory, accept value from pipeline by propertyname, aliased to 'Y'
.PARAMETER Month
    Integer in the range 1-12, mandatory, accept value from pipeline by propertyname, aliased to 'M'
.PARAMETER IncludeInput
    Switch to include the input in the output
.EXAMPLE
    Get-LastDayInMonth -Year 2020 -Month 2

    29
.EXAMPLE
    Get-LastDayInMonth -Year 2019 -Month 2

    28
.EXAMPLE
    Get-LastDayInMonth -Year 2019 -Month 2 -IncludeInput

    Year Month Days
    ---- ----- ----
    2019     2   28
.EXAMPLE
    new-object psobject -property @{Year=2000;Month=2} | Get-LastDayInMonth

    29
.EXAMPLE
    new-object psobject -property @{Y=2019;M=2} | Get-LastDayInMonth -IncludeInput

    Year Month Days
    ---- ----- ----
    2019     2   28
.NOTES
    Inspired by: https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/calculating-first-and-last-day-of-month
#>

    [cmdletbinding()]
    [outputtype('int')]
    param(
        [parameter(Mandatory, HelpMessage = 'Please enter a year in the range 1-9999', ValueFromPipelineByPropertyName)]
        [ValidateRange(1, 9999)]
        [Alias('Y')]
        [int] $Year,

        [parameter(Mandatory, HelpMessage = 'Please enter a month in the range 1-12', ValueFromPipelineByPropertyName)]
        [ValidateRange(1, 12)]
        [Alias('M')]
        [int] $Month,

        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        $ReturnVal = [datetime]::DaysInMonth($Year, $Month)
        if ($IncludeInput) {
            New-Object -TypeName psobject -Property ([ordered] @{
                    Year  = $Year
                    Month = $Month
                    Days  = $ReturnVal
                })
        } else {
            Write-Output -InputObject $ReturnVal
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
