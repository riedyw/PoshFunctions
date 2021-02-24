function Get-TruncatedDate {
<#
.SYNOPSIS
    To truncate a date at a given level
.DESCRIPTION
    To truncate a date at a given level
.PARAMETER Date
    The date that you wish to truncate.
.PARAMETER WhereToTruncate
    A string containing where in the date you wish to truncate. Has a ValidateSet
    against it of: 'Millisecond', 'Second', 'Minute', 'Hour', 'Day', 'Month'
.PARAMETER IncludeInput
    A switch determining if you wish to see the original date in the output, aliased to 'IncludeOriginal'
.EXAMPLE
    All of the following examples will be looking to truncate $testdate. Here is how $testdate
    is originally set.

    $prop = ([ordered] @{
        Year = 2020
        Month = 3
        Day = 15
        Hour = 11
        Minute = 39
        Second = 43
        Millisecond = 780
    })
    $testdate = get-date @prop
.EXAMPLE
    Example of truncating at Millisecond and including original date in output

    Get-TruncatedDate -Date $testdate -WhereToTruncate Millisecond -IncludeInput

    Original                Where       Truncated
    --------                -----       ---------
    2020/03/15 11:39:43.780 MilliSecond 2020/03/15 11:39:43.000
.EXAMPLE
    Example of truncating at Second
    Get-TruncatedDate -Date $testdate -WhereToTruncate Second

    Sunday, March 15, 2020 11:39:00 AM
.EXAMPLE
    Example of truncating at Minute
    Get-TruncatedDate -Date $testdate -WhereToTruncate Minute

    Sunday, March 15, 2020 11:00:00 AM
.EXAMPLE
    Example of truncating at Hour
    Get-TruncatedDate -Date $testdate -WhereToTruncate Hour

    Sunday, March 15, 2020 12:00:00 AM
.EXAMPLE
    Example of truncating at Day
    Get-TruncatedDate -Date $testdate -WhereToTruncate Day

    Sunday, March 1, 2020 12:00:00 AM
.EXAMPLE
    Example of truncating at Month
    Get-TruncatedDate -Date $testdate -WhereToTruncate Month

    Wednesday, January 1, 2020 12:00:00 AM
.NOTES
    # source   # https://www.reddit.com/r/usefulscripts/comments/9ghdzo/powershell_setdatetruncate_is_that_dumb_function/

#>

    [CmdletBinding(ConfirmImpact = 'None')]
    Param
    (
        [Parameter(Position = 0, ValueFromPipeline)]
        [datetime[]] $Date = $(Get-Date),

        [ValidateSet('Millisecond', 'Second', 'Minute', 'Hour', 'Day', 'Month')]
        [string] $WhereToTruncate = 'Hour',

        [Alias('IncludeOriginal')]
        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        switch ($WhereToTruncate) {
            'MilliSecond' {
                $Where = 'MilliSecond'
                $GD_Params = @{
                    MilliSecond = 0
                }
                break
            }
            'Second' {
                $Where = 'Second'
                $GD_Params = @{
                    MilliSecond = 0
                    Second      = 0
                }
                break
            }
            'Minute' {
                $Where = 'Minute'
                $GD_Params = @{
                    MilliSecond = 0
                    Second      = 0
                    Minute      = 0
                }
                break
            }
            'Hour' {
                $Where = 'Hour'
                $GD_Params = @{
                    MilliSecond = 0
                    Second      = 0
                    Minute      = 0
                    Hour        = 0
                }
                break
            }
            'Day' {
                $Where = 'Day'
                $GD_Params = @{
                    MilliSecond = 0
                    Second      = 0
                    Minute      = 0
                    Hour        = 0
                    Day         = 1
                }
                break
            }
            'Month' {
                $Where = 'Month'
                $GD_Params = @{
                    MilliSecond = 0
                    Second      = 0
                    Minute      = 0
                    Hour        = 0
                    Day         = 1
                    Month       = 1
                }
                break
            }
        } # end >> switch ($WhereToTruncate)

        foreach ($currentDate in $Date) {
            $ReturnVal = $currentDate | Get-Date @GD_Params
            if ($IncludeInput) {
                New-Object -TypeName 'psobject' -Property ([ordered] @{
                        Original  = Get-Date -Date $currentDate -Format 'yyyy/MM/dd HH:mm:ss.fff'
                        Where     = $Where
                        Truncated = Get-Date -Date $ReturnVal   -Format 'yyyy/MM/dd HH:mm:ss.fff'
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
