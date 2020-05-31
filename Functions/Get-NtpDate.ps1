Function Get-NtpDate  {
<#
.SYNOPSIS
    To get the time from an NTP server
.DESCRIPTION
    To get the time from an NTP server.

    Will return a [DateTime] and accepts the -Verbose parameter. If request fails it will return "1/1/1900"
.PARAMETER ComputerName
    The name or IPv4 address of the computer running NTP
.PARAMETER Port
    The port number NTP is listening to. Defaults to 123
.NOTES
    Author:     Bill Riedy
    Version:    1.0
.EXAMPLE
    Get-NtpDate $DC
    Assuming $DC holds the name of the domain controller then would return a datetime similar to
    Monday, March 05, 2018 9:52:57 AM
.EXAMPLE
    Test-NtpDateVsNow "DoesNotExist"
    Assuming "DoesNotExist" doesn't actually exist as a computer name then would return the datetime
    Monday, January 01, 1900 12:00:00 AM
.OUTPUTS
    [datetime]
#>
    [CmdletBinding()]
    Param (
        [parameter(Mandatory,HelpMessage='Add help message for user',
                   ValueFromPipeline,
                   Position=0)]
        [Alias('NtpServer')]
        [string] $ComputerName,

        [int] $Port = 123
    )

    begin {
        write-verbose -message "Attempting to get time from NTP server $ComputerName"
        $oldEA = $ErrorActionPreference
        $ErrorActionPreference = 'Stop'
    }

    process {
        $Socket = New-Object -typename Net.Sockets.Socket -argumentlist ( 'InterNetwork', 'Dgram', 'Udp' )
        $Socket.SendTimeOut    = 2000  # ms
        $Socket.ReceiveTimeOut = 2000  # ms
        try {
            $Socket.Connect( $ComputerName, $Port )
            $NTPData    = New-Object -TypeName byte[] -ArgumentList 48
            $NTPData[0] = 27 # Request header: 00 = No Leap Warning; 011 = Version 3; 011 = Client Mode; 00011011 = 27
            $Socket.Send(    $NTPData ) | Out-Null
            $Socket.Receive( $NTPData ) | Out-Null
            $Seconds = [BitConverter]::ToUInt32( $NTPData[43..40], 0 )
            (get-date -date '1/1/1900' ).AddSeconds( $Seconds ).ToLocalTime()
            write-verbose -message "Successfully received time from NTP $ComputerName"
        } catch {
            #get-date -date '1/1/1900'
            write-verbose -message "Failed receiving time from $ComputerName, server not up, or not running NTP"
            write-error -Message "Could not make an NTP connection over port $Port to $ComputerName"
        }
    }

    end {
        $ErrorActionPreference = $oldEA
    }
} #EndFunction Get-NtpDate
