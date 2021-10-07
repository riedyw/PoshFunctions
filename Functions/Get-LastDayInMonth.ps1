function Get-LastDayInMonth {
    <#
.SYNOPSIS
    Get the last day of the month given the year as an integer, and the month as an integer
.DESCRIPTION
    Get the last day of the month given the year as an integer, and the month as an integer
.PARAMETER Year
    Integer in the range 1-9999, mandatory, accept value from pipeline by propertyname, parameter set name 'YearMonth'
.PARAMETER Month
    Integer in the range 1-12, mandatory, accept value from pipeline by propertyname, parameter set name 'YearMonth'
.PARAMETER Date
    Datetime value, accept value from pipeline by propertyname, default parameter set name 'Date'
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
    Get-Date 'Feb 1, 2019' | Get-LastDayInMonth -IncludeInput

    Year Month Days
    ---- ----- ----
    2019     2   28
.EXAMPLE
    Get-LastDayInMonth -IncludeInput -Verbose

    Assuming the current day was in September 2021 the result would be:
    VERBOSE: Starting [Get-LastDayInMonth]
    VERBOSE: ParameterSetName [Date]

    VERBOSE: Ending [Get-LastDayInMonth]
    Year Month Days
    ---- ----- ----
    2021     9   30
.NOTES
    Inspired by: https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/calculating-first-and-last-day-of-month

    - added $Date parameter and parameter set names to function
#>

    [CmdletBinding(DefaultParameterSetName = 'Date')]
    [OutputType('int')]
    param(
        [Parameter(Mandatory, HelpMessage = 'Please enter a year in the range 1-9999', ValueFromPipelineByPropertyName, ParameterSetName = 'YearMonth')]
        [ValidateRange(1, 9999)]
        [int] $Year,

        [Parameter(Mandatory, HelpMessage = 'Please enter a month in the range 1-12', ValueFromPipelineByPropertyName, ParameterSetName = 'YearMonth')]
        [ValidateRange(1, 12)]
        [int] $Month,

        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'Date')]
        [datetime] $Date = (Get-Date),

        [Parameter(ParameterSetName = 'Date')]
        [Parameter(ParameterSetName = 'YearMonth')]
        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "ParameterSetName [$($PsCmdlet.ParameterSetName)]"
    }

    process {
        switch ($PsCmdlet.ParameterSetName) {
            'YearMonth' {
            }
            'Date' {
                [int] $Year = Get-Date -Date $Date -Format 'yyyy'
                [int] $Month = Get-Date -Date $Date -Format 'MM'
            }
        }
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
