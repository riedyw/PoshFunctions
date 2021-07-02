function ConvertTo-UTC {
<#
.SYNOPSIS
    Converts a datetime from local time to UTC
.DESCRIPTION
    Converts a datetime from local time to UTC. Can optionally include the original datetime entered.
.PARAMETER Date
    The datetime that you wish to be converted to UTC. Can be a single datetime or an array. Can be passed from the pipeline.
    This parameter has an alias of 'DateTime'.
.PARAMETER IncludeOriginal
    A switch which controls if you wish to see the original inputted date in the output.
.EXAMPLE
    ConvertTo-UTC -Date '1/25/2018 8:34:31 AM'

    Assuming that your local time zone is EST, and your region/culture is EN-US this would return the string

    Thursday, January 25, 2018 1:34:31 PM
.EXAMPLE
    ConvertTo-UTC '2/1/2018 4:27:59 PM'

    Assuming that your local time zone is EST, and your region/culture is EN-US this would return the string

    Thursday, February 01, 2018 9:27:59 PM
.EXAMPLE
    "3/15/2018 12:00:00 PM" | ConvertTo-UTC

    Assuming that your local time zone is EST, and your region/culture is EN-US this would return the string

    Thursday, March 15, 2018 4:00:00 PM
.EXAMPLE
    "3/15/2018 12:00:00 PM" | ConvertTo-UTC -IncludeOriginal

    Assuming that your local time zone is EST, and your region/culture is EN-US this would return the string

    Original              UTC
    --------              ---
    3/15/2018 12:00:00 PM 3/15/2018 4:00:00 PM
#>

    [CmdletBinding(ConfirmImpact = 'None')]
    [OutputType('datetime')]
    Param
    (
        [Parameter(Mandatory, HelpMessage='Enter a datetime string', ValueFromPipeline, Position = 0)]
        [Alias('DateTime')]
        [datetime[]] $Date,

        [switch] $IncludeOriginal
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $strCurrentTimeZone = (Get-CimInstance -ClassName win32_timezone).Description
        Write-Verbose -Message "Your local timezone is '$strCurrentTimeZone'"
    }

    process {
        foreach ($currentDate in $Date) {
            Write-Verbose -Message "You entered a Local Time of:  '$currentDate'"
            $ReturnVal = $currentDate.ToUniversalTime()
            Write-Verbose -Message "The UTC time is: '$ReturnVal'"
            if ($IncludeOriginal) {
                New-Object -TypeName 'psobject' -Property ([ordered] @{LocalTime = $currentDate; UTC = $ReturnVal })
            } else {
                Write-Output -InputObject $ReturnVal
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

} #EndFunction ConvertTo-UTC
