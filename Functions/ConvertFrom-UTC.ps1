# inspired by: https://blogs.technet.microsoft.com/heyscriptingguy/2017/02/01/powertip-convert-from-utc-to-my-local-time-zone/

Function ConvertFrom-UTC {
<#
.SYNOPSIS
    Converts a datetime from UTC to local time
.DESCRIPTION
    Converts a datetime from Universal Coordinated Time to local time
.EXAMPLE
    ConvertFrom-UTC -DateTime "1/25/2018 1:34:31 PM"

    Assuming that your local time zone is EST, and your region/culture is EN-US this would return the datetime

    Thursday, January 25, 2018 8:34:31 AM
.EXAMPLE
    ConvertFrom-UTC '2/1/2018 9:27:59 PM'

    Assuming that your local time zone is EST, and your region/culture is EN-US this would return the datetime

    Thursday, February 01, 2018 4:27:59 PM
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
.LINK
    [System.TimeZoneInfo]
#>
    [CmdletBinding()]
    [OutputType('datetime')]
    param(
        [parameter(Mandatory, ValueFromPipeline, Position=0 )]
        [string] $UTCTime
    )

    Begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    } #close begin block

    Process {
        $newUTCTime = get-date -Date $UTCTime
        write-verbose -Message "You entered a UTC Time of:  '$UTCTime'"
        $strCurrentTimeZone = (Get-CimInstance -ClassName win32_timezone).StandardName
        $strCurrentTimeZoneDescription = (Get-CimInstance -ClassName win32_timezone).Description
        write-verbose -Message "Your local timezone is '$strCurrentTimeZoneDescription'"
        $TZ = [System.TimeZoneInfo]::FindSystemTimeZoneById($strCurrentTimeZone)
        $LocalTime = [System.TimeZoneInfo]::ConvertTimeFromUtc($newUTCTime, $TZ)
        write-verbose -Message "Your local time is: '$LocalTime'"
        write-output -InputObject $LocalTime
    }

    End {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    } #close end block

} #EndFunction ConvertFrom-UTC
