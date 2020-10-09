Function Test-NtpDateVsNow {
<#
.SYNOPSIS
    To test whether local time and NTP time fall within a particular tolerance
.DESCRIPTION
    To test whether local time and NTP time fall within a particular tolerance. The NTP protocol allows for an acceptable drift between local and NTP time.
    Will return a [Boolean] and accepts the -Verbose parameter
.PARAMETER ComputerName
    The name or IPv4 address of the computer running NTP
.PARAMETER Tolerance
    The acceptable number of seconds difference between local and NTP time. Default = 300. Valid range 1-3600 seconds (1 hour)
.NOTES
    Will return a value of $False if either: a) the time difference is greater than the $Tolerance; or b) the time server does not reply to the NTP time request being sent by this function
.EXAMPLE
    Test-NtpDateVsNow $DC
    Assuming $DC holds the name of the domain controller then would return the boolean
    $True
.EXAMPLE
    Test-NtpDateVsNow "DoesNotExist"
    Assuming "DoesNotExist" doesn't actually exist as a computer name then would return the boolean
    $False
.OUTPUTS
    A boolean $true or $false indicating if comparing local time to NTP time falls within a tolerance
.LINK
    NTP - Network Time Protocol
.LINK
    w32tm.exe
.LINK
    http://www.pool.ntp.org/en/
#>

    #region Parameters
    [CmdletBinding(ConfirmImpact='None')]
    [OutputType('bool')]
    Param (
        # Specifies the NTP server to communicate with
        [parameter(Mandatory,
                   ValueFromPipeline,
                   Position=0,
                   HelpMessage='Enter a ComputerName or IpAddress of a system acting as a time server [domain controller] or appliance')]
        [Alias('NtpServer')]
        [string] $ComputerName,

        # Specifies the acceptable number of seconds difference between local and NTP time
        [parameter(ValueFromPipeLineByPropertyName)]
        [ValidateRange(1,3600)]
        [int] $Tolerance = 300
    )
    #endregion Parameters

    begin {
    Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    process {
        $Ntp = Get-NtpDate -ComputerName ($ComputerName)
        write-verbose -message "Getting NTP time from $ComputerName and time is $Ntp"
        $Now = Get-Date
        write-verbose -message "Getting local time and time is $Now"
        $AbsDiff = [math]::Abs(($ntp - $now).TotalSeconds)
        write-verbose -message "There are $AbsDiff seconds difference between times, and comparing to $Tolerance is"
        if ($AbsDiff -gt $Tolerance) {
            write-output -inputobject $false
        } else {
            write-output -inputobject $true
        }
    }

    end {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }
} #EndFunction Test-NtpDateVsNow
