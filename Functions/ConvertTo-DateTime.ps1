function ConvertTo-DateTime {
<#
.SYNOPSIS
    Converts a formatted date string back into a datetime datatype.
.DESCRIPTION
    Converts a formatted date string back into a datetime datatype.
.PARAMETER DateString
    The date string that you wish to convert back to a datetime. Alias 'Date'.  Can be input from the pipeline.
.PARAMETER DMTF
    A switch parameter to display in DMTF format. Default parameter set.

    DmtfDateTime is of the form 'yyyyMMddHHmmss.ffffff+UUU'

    Where
    yyyy    is the 4 digit year
    MM      is the 2 digit month
    dd      is the 2 digit day of the month
    HH      is the 2 digit in 24 hour format (00-23, 1 pm = 13)
    mm      is the 2 digit minute (00-59)
    ss      is the 2 digit second (00-59)
    ffffff  is the 6 digit microsecond
    +       is a plus or minus to indicate offset from UTC
    UUU     is the 3 digit number of minutes offset from UTC (000-720)
.PARAMETER Unix
    A switch parameter to convert from a UnixEpoch which is the number of seconds since '1/1/1970 12:00:00 AM UTC'.
.PARAMETER FileTime
    Converts a large integer filetime [int64] into a datetime string. There is a special value that returns a value of 'Never'.

    Filetimes are expressed in Ticks. Ticks can range from 0 - 2650467743999999999. Translating these into dates you get
                0 = Monday, January 01, 1601 12:00:00.00000 AM
    2650467743999999999 = Friday, December 31, 9999 11:59:59.99999 PM
.PARAMETER ICSDateTime
    IcsDateTime is of the form 'yyyyMMddTHHmmssZ'

    Where
    yyyy    is the 4 digit year
    MM      is the 2 digit month
    dd      is the 2 digit day of the month
    HH      is the 2 digit in 24 hour format (00-23, 1 pm = 13)
    mm      is the 2 digit minute (00-59)
    ss      is the 2 digit second (00-59)
    T       is the letter T
    Z       is an optional suffix indicating UTC or Zulu time

    If the final character is NOT a Z then the time is local time.
.PARAMETER ISO8601
    Switch to convert a datetime to ISO-8601 format: 'yyyy.MM.ddTHH:mm:ss'
.PARAMETER Excel
    Switch to indicate that the datestring is in Excel format which represents dates as the number of days since (get-date 1/1/1900)
.PARAMETER Format
    See help for Get-Date and the -Format parameter. This will parse the datestring using the Format as a template.
.PARAMETER IncludeInput
    Switch to enable the original datetime to appear in the output. Aliased to 'IncludeOriginal'
.PARAMETER UTC
    Switch to force the output to be in the UTC timezone. Alias of this parameter is 'Zulu'
.EXAMPLE
    ConvertTo-DateTime '20161124225058.082190+060'

    If you were in the EST timezone this would return the datetime

    Thursday, November 24, 2016 4:50:58 PM
.EXAMPLE
    ConvertTo-DateTime -DateString 946684799 -Unix -UTC

    Would return
    Friday, December 31, 1999 11:59:59 PM
.EXAMPLE
    ConvertTo-DateTime '20161124T225058Z' -ICSDateTime

    If in the EST timezone this would return
    Thursday, November 24, 2016 5:50:58 PM
.EXAMPLE
    ConvertTo-DateTime 131619940792563529 -FileTime -UTC

    Would return
    Thursday, February 1, 2018 9:27:59 PM
.EXAMPLE
    ConvertTo-DateTime '20-04-01' -Format 'yy-MM-dd'

    Would return
    Wednesday, April 1, 2020 12:00:00 AM
.EXAMPLE
    ConvertTo-DateTime -DateString 946684799 -Unix -Verbose

    Would return
    VERBOSE: Starting [ConvertTo-DateTime]
    VERBOSE: ParameterSetName [Unix]
    VERBOSE: Your local timezone is '(UTC-05:00) Eastern Time (US & Canada)'
    VERBOSE: The date '12/31/1999 18:59:59' is 946684799 seconds in the future of '01/01/1970 00:00:00' UTC

    Friday, December 31, 1999 6:59:59 PM
    VERBOSE: Ending ConvertTo-DateTime
.EXAMPLE
    ConvertTo-DateTime -ISO8601 2022.02.01T05:00:00z -IncludeInput

    ISO8601              DateTime
    -------              --------
    2022.02.01T05:00:00z 2/1/2022 12:00:00 AM
.NOTES
    Info:       For further information on DMTF time formats see https://docs.microsoft.com/en-us/windows/desktop/wmisdk/cim-datetime

    Added Excel functionality
#>

    #region parameter
    [CmdletBinding(DefaultParameterSetName = 'DMTF',ConfirmImpact='None')]
    [OutputType('datetime')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter','')]
    Param
    (

        [Parameter(Mandatory, ValueFromPipeline, Position = 0, ParameterSetName = 'DMTF')]
        [Parameter(Mandatory, ValueFromPipeline, Position = 0, ParameterSetName = 'Unix')]
        [Parameter(Mandatory, ValueFromPipeline, Position = 0, ParameterSetName = 'FileTime')]
        [Parameter(Mandatory, ValueFromPipeline, Position = 0, ParameterSetName = 'ICSDateTime')]
        [Parameter(Mandatory, ValueFromPipeline, Position = 0, ParameterSetName = 'ISO8601')]
        [Parameter(Mandatory, ValueFromPipeline, Position = 0, ParameterSetName = 'Format')]
        [Parameter(Mandatory, ValueFromPipeline, Position = 0, ParameterSetName = 'Excel')]
        [Alias('Date')]
        [string[]] $DateString,

        [Parameter(ParameterSetName = 'DMTF')]
        [switch] $DMTF,

        [Parameter(ParameterSetName = 'Unix')]
        [switch] $Unix,

        [Parameter(ParameterSetName = 'FileTime')]
        [switch] $FileTime,

        [Parameter(ParameterSetName = 'ICSDateTime')]
        [switch] $ICSDateTime,

        [Parameter(ParameterSetName = 'ISO8601')]
        [switch] $ISO8601,

        [Parameter(ParameterSetName = 'Format')]
        [string] $Format,

        [Parameter(ParameterSetName = 'Excel')]
        [switch] $Excel,

        [Parameter(ParameterSetName = 'DMTF')]
        [Parameter(ParameterSetName = 'Unix')]
        [Parameter(ParameterSetName = 'FileTime')]
        [Parameter(ParameterSetName = 'ICSDateTime')]
        [Parameter(ParameterSetName = 'ISO8601')]
        [Parameter(ParameterSetName = 'Format')]
        [Parameter(ParameterSetName = 'Excel')]
        [Alias('IncludeOriginal')]
        [switch] $IncludeInput,

        [Parameter(ParameterSetName = 'DMTF')]
        [Parameter(ParameterSetName = 'Unix')]
        [Parameter(ParameterSetName = 'FileTime')]
        [Parameter(ParameterSetName = 'ICSDateTime')]
        [Parameter(ParameterSetName = 'ISO8601')]
        [Parameter(ParameterSetName = 'Format')]
        [Parameter(ParameterSetName = 'Excel')]
        [Alias('Zulu')]
        [switch] $UTC
    )
    #endregion parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "ParameterSetName [$($PsCmdlet.ParameterSetName)]"
        $BeginUnixEpoch = New-Object -TypeName DateTime -ArgumentList 1970, 1, 1, 0, 0, 0, ([DateTimeKind]::Utc)
        #$DmtfRegex = '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]\.[0-9][0-9][0-9][0-9][0-9][0-9][+-][0-9][0-9][0-9]'
        $DmtfRegex = '^(\d{14})\.(\d{6})[+-](\d{3})$'
        $MaxTicks = 2650467743999999999
        $Never = 9223372036854775807
        $ICSDateTimeregexp = '^(\d{8})(T)(\d{6})(Z)?$'
        $ISOregex = '^(\d{4}\.\d{2}\.\d{2})(T)(\d{2}:\d{2}:\d{2})(Z)?$'
        $strCurrentTimeZone = (Get-CimInstance -ClassName win32_timezone -Verbose:$false).Description
        Write-Verbose -Message "Your local timezone is '$strCurrentTimeZone'"
    }

    process {
        foreach ($DS in $DateString) {
            Write-Verbose -Message "Current datestring is [$DS]"
            switch ($PsCmdlet.ParameterSetName) {
                'DMTF' {
                    Write-Verbose -Message "DTMF is [$DS]"
                    Write-Verbose -Message "Regex is [$dmtfregex]"
                    $prop = ([ordered] @{ DMTF = $DS } )
                    if ( -not ($DS -match $DmtfRegex)) {
                        Write-Verbose -message "The DMTF date time should be of the form 'YYYYMMDDHHmmss.ffffff+###'"
                        $ReturnVal = $null
                    } else {
                        $ReturnVal = ([Management.ManagementDateTimeConverter]::ToDateTime("$DS"))
                    }
                    if ($UTC) {
                        $ReturnVal = ConvertTo-UTC -Date $ReturnVal -Verbose:$false
                    }
                    $prop.DateTime = $ReturnVal
                    Write-Verbose -Message "ReturnVal is [$ReturnVal]"
                }
                'Unix' {
                    $prop = ([ordered] @{ Unix = $DS } )
                    $ReturnVal = ConvertFrom-UTC -Date ( $BeginUnixEpoch.AddSeconds($DS) ) -Verbose:$false
                    if ($UTC) {
                        $ReturnVal = ConvertTo-UTC -Date $ReturnVal -Verbose:$false
                    }
                    Write-Verbose -Message "The date '$ReturnVal' is $DS seconds in the future of '$BeginUnixEpoch' UTC"
                    $prop.DateTime = $ReturnVal
                }
                'FileTime' {
                    $prop = ([ordered] @{ FileTime = $DS } )
                    if ( ([int64] $DS) -gt $MaxTicks ) {
                        Write-Verbose -Message "The number of ticks passed $FileTime is greater than $MaxTicks"
                        if ( ([int64] $DS) -eq $Never ) {
                            Write-Verbose -Message "The number of ticks passed $FileTime equals the value for Never $Never"
                            $ReturnVal = ([datetime]::MaxValue)
                        } else {
                            Write-Verbose -Message "The number of ticks passed $FileTime is greater than $MaxTicks but is less than Never $Never"
                            $ReturnVal = 'Invalid'
                        }
                    } else {
                        Write-Verbose -Message "The number of ticks passed $FileTime is within the valid range of 0 - $MaxTicks"
                        $ReturnVal = [datetime]::FromFileTime($DS)
                        if ($UTC) {
                            $ReturnVal = ConvertTo-UTC -Date $ReturnVal -Verbose:$false
                        }
                    }
                    if ($ReturnVal -ne 'Invalid' -and $UTC) {
                        $ReturnVal = ConvertTo-UTC -Date $ReturnVal -Verbose:$false
                    }
                    $prop.DateTime = $ReturnVal
                }
                'ICSDateTime' {
                    $prop = ([ordered] @{ ICSDateTime = $DS } )
                    if ( -not ($DS -match $IcsDateTimeregexp)) {
                        Write-Verbose -message "The ICS date time should be of the form 'yyyymmddTHHMMSSZ'"
                        $ReturnVal = 'Invalid'
                    } else {
                        if ( $matches[4]) {
                            # the ICS datetime ends with 'Z'
                            $ReturnVal = [datetime]::parseexact($DS, 'yyyyMMddTHHmmssZ', $null)
                        } else {
                            $ReturnVal = [datetime]::parseexact($DS, 'yyyyMMddTHHmmss', $null)
                        }
                    }
                    if ($ReturnVal -ne 'Invalid' -and $UTC) {
                        $ReturnVal = ConvertTo-UTC -Date $ReturnVal -Verbose:$false
                    }
                    $prop.DateTime = $ReturnVal
                }
                'ISO8601' {
                    $prop = ([ordered] @{ ISO8601 = $DS } )
                    if ( -not ($DS -match $ISOregex)) {
                        Write-Verbose -message "The ISO date time should be of the form 'yyyy.MM.ddTHHmmssZ'"
                        $ReturnVal = 'Invalid'
                    } else {
                        if ( $matches[4]) {
                            # the ICS datetime ends with 'Z'
                            $ReturnVal = [datetime]::parseexact($DS, 'yyyy.MM.ddTHH:mm:ssZ', $null)
                        } else {
                            $ReturnVal = [datetime]::parseexact($DS, 'yyyy.MM.ddTHH:mm:ss', $null)
                        }
                    }
                    if ($ReturnVal -ne 'Invalid' -and $UTC) {
                        $ReturnVal = ConvertTo-UTC -Date $ReturnVal -Verbose:$false
                    }
                    $prop.DateTime = $ReturnVal
                }
                'Format' {
                    $prop = ([ordered] @{ DateString = $DS; Format = $Format } )
                    $ReturnVal = [datetime]::parseexact($DS, $Format, $null)
                    if ($UTC) {
                        $ReturnVal = ConvertTo-UTC -Date $ReturnVal -Verbose:$false
                    }
                    $prop.DateTime = $ReturnVal
                }
                'Excel' {
                    $prop = ([ordered] @{ Excel = $DS } )
                    $ReturnVal = (get-date -Date 1/1/1900 ) + [timespan]::FromDays($DS)
                    if ($UTC) {
                        $ReturnVal = ConvertTo-UTC -Date $ReturnVal -Verbose:$false
                    }
                    $prop.DateTime = $ReturnVal
                }
            }
            if ($IncludeInput) {
                New-Object -TypeName psobject -Property $prop
            } else {
                Write-Output -inputobject $ReturnVal
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

} #EndFunction ConvertTo-DateTime
