function ConvertFrom-UTC {
<#
.SYNOPSIS
    Converts a datetime from UTC to local time
.DESCRIPTION
    Converts a datetime from Universal Coordinated Time to local time
.PARAMETER Date
    The date you wish to convert to UTC
.PARAMETER IncludeInput
    Switch to enable displaying input parameters in the output
.EXAMPLE
    ConvertFrom-UTC -Date "1/25/2018 1:34:31 PM"

    Assuming that your local time zone is EST, and your region/culture is EN-US this would return the datetime

    Thursday, January 25, 2018 8:34:31 AM
.EXAMPLE
    ConvertFrom-UTC -Date "1/25/2018 1:34:31 PM" -IncludeInput

    Assuming that your local time zone is EST, and your region/culture is EN-US this would return the datetime

    UTC                  LocalTime
    ---                  ---------
    1/25/2018 1:34:31 PM 1/25/2018 8:34:31 AM
.EXAMPLE
    ConvertFrom-UTC '2/1/2018 9:27:59 PM' -verbose

    Would return
    VERBOSE: Starting ConvertFrom-UTC
    VERBOSE: You entered a UTC Time of:  '2/1/2018 9:27:59 PM'
    VERBOSE: Your local timezone is '(UTC-05:00) Eastern Time (US & Canada)'
    VERBOSE: Your local time is: '02/01/2018 16:27:59'

    Thursday, February 1, 2018 4:27:59 PM
    VERBOSE: Ending ConvertFrom-UTC
.EXAMPLE
    "3/15/2018 12:00:00 PM" | ConvertFrom-UTC

    Assuming that your local time zone is EST, and your region/culture is EN-US this would return the datetime

    Thursday, March 15, 2018 8:00:00 AM
.EXAMPLE
    ConvertFrom-UTC -date '2/1/2018 9:27:59 PM' -IncludeInput

    Would return the following if your local time zone is EST, and your region/culture is EN-US
    UTC                 LocalTime
    ---                 ---------
    2/1/2018 9:27:59 PM 2/1/2018 4:27:59 PM
.NOTES
    # inspired by: https://blogs.technet.microsoft.com/heyscriptingguy/2017/02/01/powertip-convert-from-utc-to-my-local-time-zone/
.LINK
    [System.TimeZoneInfo]
#>

    [CmdletBinding()]
    [OutputType('datetime')]
    param(
        [parameter(Mandatory,HelpMessage='Enter a datetime string', ValueFromPipeline, Position = 0)]
        [datetime[]] $Date,

        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $strCurrentTimeZone = (Get-CimInstance -ClassName win32_timezone).StandardName
        $strCurrentTimeZoneDescription = (Get-CimInstance -ClassName win32_timezone).Description
        Write-Verbose -Message "Your local timezone is '$strCurrentTimeZoneDescription'"
        $TZ = [TimeZoneInfo]::FindSystemTimeZoneById($strCurrentTimeZone)
    } #close begin block

    process {
        foreach ($currentDate in $Date) {
            $newUTCTime = Get-Date -Date $currentDate
            Write-Verbose -Message "You entered a UTC Time of:  [$currentDate]"
            $ReturnVal = [TimeZoneInfo]::ConvertTimeFromUtc($newUTCTime, $TZ)
            if ($IncludeInput) {
                New-Object -TypeName 'psobject' -Property ([ordered] @{
                        UTC       = $currentDate
                        LocalTime = $ReturnVal
                    })
            } else {
                Write-Output -InputObject $ReturnVal
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
