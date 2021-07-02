function Test-NtpDateVsNow {
<#
.SYNOPSIS
    To test whether local time and NTP time fall within a particular tolerance
.DESCRIPTION
    To test whether local time and NTP time fall within a particular tolerance. The NTP protocol allows for an acceptable drift between local and NTP time.
    Will return a [Boolean] and accepts the -Verbose parameter
.PARAMETER ComputerName
    The name or IPv4 address of the computer running NTP. If left blank uses the Get-ADDomainController command to find domain controller which runs NTP. Aliased
    to 'CN', 'Server', 'NtpServer'
.PARAMETER Tolerance
    The acceptable number of seconds difference between local and NTP time. Default = 300. Valid range 1-3600 seconds (1 hour)
.PARAMETER IncludeInput
    Switch indicating whether to include the input parameters in the output
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
.EXAMPLE
    Test-NtpDateVsNow -ComputerName server01 -IncludeInput

    Example result
    LocalDate            NTPDate              Tolerance Difference Result NTPServer
    ---------            -------              --------- ---------- ------ ---------
    2/23/2021 2:18:02 PM 2/23/2021 2:18:02 PM       300  0.4763647   True server01
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
    [CmdletBinding(ConfirmImpact = 'None')]
    [OutputType('bool')]
    Param (
        # Specifies the NTP server to communicate with
        [parameter(ValueFromPipeline, Position = 0)]
        [Alias('NtpServer', 'CN', 'Server')]
        [string] $ComputerName = (Get-ADDomainController).HostName,

        # Specifies the acceptable number of seconds difference between local and NTP time
        [parameter(ValueFromPipeLineByPropertyName)]
        [ValidateRange(1, 3600)]
        [int] $Tolerance = 300,

        [switch] $IncludeInput
    )
    #endregion Parameters

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        $Ntp = Get-NtpDate -ComputerName ($ComputerName)
        Write-Verbose -Message "Getting NTP time from $ComputerName and time is $Ntp"
        $Now = Get-Date
        Write-Verbose -Message "Getting local time and time is $Now"
        $AbsDiff = [math]::Abs(($ntp - $now).TotalSeconds)
        Write-Verbose -Message "There are $AbsDiff seconds difference between times, and comparing to $Tolerance is"
        if ($AbsDiff -gt $Tolerance) {
            $ReturnVal = $false
        } else {
            $ReturnVal = $true
        }
        if ($IncludeInput) {
            New-Object -TypeName psobject -Property ([ordered] @{
                LocalDate = $Now
                NTPDate = $Ntp
                Tolerance = $Tolerance
                Difference = $AbsDiff
                Result = $ReturnVal
                NTPServer = $ComputerName
            })
        } else {
            Write-Output -InputObject $ReturnVal
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
