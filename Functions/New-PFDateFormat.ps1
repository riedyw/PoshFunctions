function New-PFDateFormat {
<#
.SYNOPSIS
    Returns a [psobject] with a [datetime] in multiple other formats
.DESCRIPTION
    Returns a [psobject] with a [datetime] in multiple other formats
.PARAMETER Date
    Optional [datetime] parameter for the date you want converted into other formats. If omitted it will call the class::New method with no parameter
    which will determine the current [datetime] and format it several different ways
.EXAMPLE
    New-PFDateFormat -Date '9/11/2001 08:15'

    Date        : 9/11/2001 8:15:00 AM
    DMTF        : 20010911081500.000000-240
    Unix        : 1000196100
    FileTime    : 126446877000000000
    ICSDateTime : 20010911T081500
    ISO8601     : 2001.09.11T08:15:00
    Excel       : 37143.34375
.EXAMPLE
    New-PFDateFormat

    Date        : 2/9/2022 3:14:37 PM
    DMTF        : 20220209151437.616838-300
    Unix        : 1644419677.61684
    FileTime    : 132889112776168387
    ICSDateTime : 20220209T151437
    ISO8601     : 2022.02.09T15:14:37
    Excel       : 44599.6351576023
.EXAMPLE
    New-PFDateFormat -Verbose
    VERBOSE: Starting [New-PFDateFormat]

    Date        : 2/9/2022 3:15:37 PM
    DMTF        : 20220209151537.066346-300
    Unix        : 1644419737.06635
    FileTime    : 132889113370663466
    ICSDateTime : 20220209T151537
    ISO8601     : 2022.02.09T15:15:37
    Excel       : 44599.6358456753

    VERBOSE: Ending [New-PFDateFormat]
.NOTES
    Relies on PFDateFormat class defined in .\PoshFunctions.psm1

    DMTF is of the form 'yyyymmddHHMMSS.ffffff+UUU'
    Unix is Unix epoch format which is the number of seconds since '1/1/1970 12:00:00 AM UTC'
    FileTime is an [int64] which represents a [datetime] expressed in Ticks. A Tick represents 1/100,000 of a second. Ticks can range from 0 - 2650467743999999999. Translating these into dates you get
                          0 = Monday, January 01, 1601 12:00:00.00000 AM
        2650467743999999999 = Friday, December 31, 9999 11:59:59.99999 PM
    ICSDateTime is a [datetime] formatted is of the form 'yyyyMMddTHHmmss'
    ISO8601 is a [datetime] formatted is of the form 'yyyy.MMddTHH:mm:ss'
    Excel is a [double] that represents dates as the number of days since (Get-Date 1/1/1900)
#>

    [CmdletBinding(ConfirmImpact='None')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    Param (
        [datetime] $Date
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        if ($Date) {
            [PFDateFormat]::new($Date)
        } else {
            [PFDateFormat]::new()
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
