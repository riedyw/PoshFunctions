Function Get-NtpDate {
<#
.SYNOPSIS
    To get the time from an NTP server
.DESCRIPTION
    To get the time from an NTP server.

    Will return a [DateTime] and accepts the -Verbose parameter. If request fails it will return "1/1/1900"
.PARAMETER ComputerName
    The name or IPv4 address of the computer running NTP. Aliased to 'CN', 'Server', 'NtpServer'
.PARAMETER Port
    The port number NTP is listening to. Defaults to 123
.EXAMPLE
    Get-NtpDate $DC
    Assuming $DC holds the name of the domain controller then would return a datetime similar to
    Monday, March 05, 2018 9:52:57 AM
.OUTPUTS
    [datetime]
#>
    [CmdletBinding()]
    Param (
        [parameter(Mandatory, HelpMessage = 'Add help message for user',
            ValueFromPipeline,
            Position = 0)]
        [Alias('CN', 'Server', 'NtpServer')]
        [string] $ComputerName,

        [int] $Port = 123
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "Attempting to get time from NTP server $ComputerName"
        $oldEA = $ErrorActionPreference
        $ErrorActionPreference = 'Stop'
    }

    process {
        $Socket = New-Object -TypeName Net.Sockets.Socket -ArgumentList ( 'InterNetwork', 'Dgram', 'Udp' )
        $Socket.SendTimeOut = 2000  # ms
        $Socket.ReceiveTimeOut = 2000  # ms
        try {
            $Socket.Connect( $ComputerName, $Port )
            $NTPData = New-Object -TypeName byte[] -ArgumentList 48
            $NTPData[0] = 27 # Request header: 00 = No Leap Warning; 011 = Version 3; 011 = Client Mode; 00011011 = 27
            $null = $Socket.Send(    $NTPData )
            $null = $Socket.Receive( $NTPData )
            $Seconds = [BitConverter]::ToUInt32( $NTPData[43..40], 0 )
            (Get-Date -Date '1/1/1900' ).AddSeconds( $Seconds ).ToLocalTime()
            Write-Verbose -Message "Successfully received time from NTP $ComputerName"
        } catch {
            #get-date -date '1/1/1900'
            Write-Verbose -Message "Failed receiving time from $ComputerName, server not up, or not running NTP"
            Write-Error -Message "Could not make an NTP connection over port $Port to $ComputerName"
        }
    }

    end {
        $ErrorActionPreference = $oldEA
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
