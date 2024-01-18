function Get-RandomDate {
<#
.SYNOPSIS
    Gets a random date
.DESCRIPTION
    Gets a random date. Can specify minimum and maximum dates. Can optionally specify -DateLimit to
    stay within the time limits of the possible datatypes. Can also use formatting switches -Format
    or -UFormat which function the same as Get-Date parameters of the same name.
.PARAMETER MinDate
    An optional [datetime] indicating the lowest date to return
.PARAMETER MaxDate
    An optional [datetime] indicating the highest date to return
.PARAMETER DateLimit
    A [string] validated against the set @('DateTime','UnixEpoch','FileTime'). Defaults to 'DateTime'
    DateLimit       MinDate                 MaxDate
    ===========     =====================   =====================
    DateTime        01/01/0001 12:00:00AM   12/31/9999 11:59:59PM
    UnixEpoch       01/01/1970 12:00:00AM   01/19/2038 03:14:07AM
    FileTime        01/01/1601 12:00:00AM   12/31/9999 11:59:59PM
.NOTES
    If you specify -MinDate or -MaxDate, -MinDate must be less than or equal to -MaxDate.
.EXAMPLE
    Get-Randomdate  -MinDate 1/1/1969 -MaxDate 1/1/2040 -DateLimit UnixEpoch -verbose
    Would return something similar to the following:
    VERBOSE: $MinDate specified as [01/01/1969 00:00:00]
    VERBOSE: $MaxDate specified as [01/01/2040 00:00:00]
    VERBOSE: $MinDate outside valid UnixEpoch setting to [01/01/1970 00:00:00]
    VERBOSE: $MaxDate outside valid UnixEpoch setting to [01/19/2038 03:14:07]
    VERBOSE: The random date calculated is [12/26/1997 18:41:51]
    VERBOSE: The return value is [System.DateTime] datatype
    Friday, December 26, 1997 6:41:51 PM
.EXAMPLE
    Get-RandomDate -DateLimit UnixEpoch
    Would return something similar to the following:
    Friday, August 12, 2005 2:57:51 AM
.EXAMPLE
    Get-RandomDate  -MinDate 1/1/1576 -MaxDate 7/4/1776 -DateLimit FileTime -Verbose
    Would return something similar to the following:
    VERBOSE: $MinDate specified as [01/01/1576 00:00:00]
    VERBOSE: $MaxDate specified as [07/04/1776 00:00:00]
    VERBOSE: $MinDate outside valid FileTime setting to [01/01/1601 00:00:00]
    VERBOSE: The random date calculated is [06/27/1615 16:45:27]
    VERBOSE: The return value is [System.DateTime] datatype
    Saturday, June 27, 1615 4:45:27 PM
.EXAMPLE
    Get-RandomDate  -MinDate 1/1/19 -MaxDate 2/1/19
    Would return something similar to the following:
    Wednesday, January 30, 2019 1:25:06 AM
.EXAMPLE
    # Desire to get random date between a year in the past, and a year in the future

    Get-RandomDate  -MinDate (Get-Date).AddMonths(-12) -MaxDate (Get-Date).AddMonths(12)

    Saturday, March 27, 2021 3:22:55 AM
.EXAMPLE
    Get-RandomDate -DateLimit UnixEpoch -IncludeInput


    DateLimit MinDate              MaxDate              RandomDate
    --------- -------              -------              ----------
    UnixEpoch 1/1/1970 12:00:00 AM 1/19/2038 3:14:07 AM 9/19/2003 1:50:32 PM
.OUTPUTS
    [datetime]
.LINK
    Get-Date
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact = 'None')]
    [OutputType('psobject')]
    Param(
        [Parameter(Position = 0)]
        [datetime] $MinDate,

        [Parameter(Position = 1)]
        [datetime] $MaxDate,

        [Parameter()]
        [ValidateSet('DateTime', 'UnixEpoch', 'FileTime')]
        [String] $DateLimit = 'DateTime',

        [switch] $IncludeInput
    )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "DateLimit [$DateLimit]"
        if (-not $MinDate) {
            $MinDate = [datetime]::MinValue
            Write-Verbose -Message "`$MinDate not specified, setting it to [$($MinDate)]"
        } else {
            Write-Verbose -Message "`$MinDate specified as [$($MinDate)]"
        }
        if (-not $MaxDate) {
            $MaxDate = [datetime]::MaxValue
            Write-Verbose -Message "`$MaxDate not specified, setting it to [$($MaxDate)]"
        } else {
            Write-Verbose -Message "`$MaxDate specified as [$($MaxDate)]"
        }
        $UnixMinDate = Get-Date -Date 1/1/1970
        $UnixMaxDate = $UnixMinDate.AddSeconds([int32]::MaxValue)
        $FileTimeMinDate = Get-Date -Date 1/1/1601
        $FileTimeMaxDate = [datetime]::MaxValue
        switch ($DateLimit) {
            'FileTime' {
                if ($MinDate -lt $FileTimeMinDate) {
                    Write-Verbose -Message "`$MinDate outside valid FileTime setting to [$($FileTimeMinDate)]"
                    $MinDate = $FileTimeMinDate
                }
                if ($MaxDate -gt $FileTimeMaxDate) {
                    Write-Verbose -Message "`$MaxDate outside valid FileTime setting to [$($FileTimeMinDate)]"
                    $MaxDate = $FileTimeMaxDate
                }
            }
            'UnixEpoch' {
                if ($MinDate -lt $UnixMinDate) {
                    Write-Verbose -Message "`$MinDate outside valid UnixEpoch setting to [$($UnixMinDate)]"
                    $MinDate = $UnixMinDate
                } elseif ($MinDate -gt $UnixMaxDate) {
                    Write-Verbose -Message "`$MinDate outside valid UnixEpoch setting to [$($UnixMaxDate)]"
                    $MinDate = $UnixMaxDate
                }
                if ($MaxDate -gt $unixMaxDate) {
                    Write-Verbose -Message "`$MaxDate outside valid UnixEpoch setting to [$($UnixMaxDate)]"
                    $MaxDate = $UnixMaxDate
                } elseif ($MaxDate -lt $UnixMinDate) {
                    Write-Verbose -Message "`$MaxDate outside valid UnixEpoch setting to [$($UnixMinDate)]"
                    $MaxDate = $UnixMinDate
                }
            }
            'DateTime' {
                # Normal limits on dates
            }
        }
        if ($MinDate -gt $MaxDate) {
            Write-Error -Message "`$MinDate can not be greater than `$MaxDate"
            break
        }
    }

    process {
        $ReturnValue = Get-Date -Date (Get-Random -Minimum ($MinDate.Ticks) -Maximum ($MaxDate.Ticks + 1))
        Write-Verbose -Message "The random date calculated is [$ReturnValue]"
        if ($IncludeInput) {
            New-Object -TypeName psobject -Property ([ordered] @{
                    DateLimit  = $DateLimit
                    MinDate    = $MinDate
                    MaxDate    = $MaxDate
                    RandomDate = $ReturnValue
                })
        } else {
            Write-Output -InputObject $ReturnValue
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
} #EndFunction Get-RandomDate
