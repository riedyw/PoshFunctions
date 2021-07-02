function Test-Port {
<#
.SYNOPSIS
    Tests a Port or a range of ports on a specific ComputerName(s).
.DESCRIPTION
    Tests a Port or a range of ports on a specific ComputerName(s). Creates a custom object with the properties: ComputerName, Protocol, Port, Open, Notes.
.PARAMETER ComputerName
    A single ComputerName or array of ComputerName to test the port connection on. Aliased to 'CN', 'Server'
.PARAMETER Port
    Port number to test ([int16] 0 - 65535), an array can also be passed
.PARAMETER TCP
    Use TCP as the transport protocol
.PARAMETER UDP
    Use UDP as the transport protocol
.PARAMETER TimeOut
    Sets a timeout for TCP or UDP port query. (In milliseconds, Default is 1000)
.EXAMPLE
    Test-Port -ComputerName 'server' -port 80
    Checks port 80 on server 'server' to see if it is listening
.EXAMPLE
    'server' | Test-Port -Port 80
    Checks port 80 on server 'server' to see if it is listening
.EXAMPLE
    Test-Port -ComputerName @("server1","server2") -Port 80
    Checks port 80 on server1 and server2 to see if it is listening
.EXAMPLE
    @("server1","server2") | Test-Port -Port 80
    Checks port 80 on server1 and server2 to see if it is listening
.EXAMPLE
    (Get-Content hosts.txt) | Test-Port -Port 80
    Checks port 80 on servers in host file to see if it is listening
.EXAMPLE
    Test-Port -ComputerName (Get-Content hosts.txt) -Port 80
    Checks port 80 on servers in host file to see if it is listening
.EXAMPLE
    Test-Port -ComputerName (Get-Content hosts.txt) -Port @(1..59)
    Checks a range of ports from 1-59 on all servers in the hosts.txt file
.OUTPUTS
    [psobject]
    An array of objects containing the fields:
    ComputerName    A string containing the computer name or ip address that was passed to the function
    Protocol        A string being either 'TCP' or 'UDP'
    Port            An integer in the range 1 - 65535
    Open            A boolean
    Notes           Any notes when attempting to make a connection
.LINK
    about_Properties
.NOTES
    # inspired by https://gallery.technet.microsoft.com/scriptcenter/97119ed6-6fb2-446d-98d8-32d823867131
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact = 'Low')]
    [OutputType('psobject')]
    Param(
        [Parameter(Mandatory, HelpMessage = 'Enter a ComputerName or IP address', Position = 0, ValueFromPipeline)]
        [Alias('CN', 'Server')]
        [string[]] $ComputerName,

        [Parameter(Position = 1, Mandatory, HelpMessage = 'Enter an integer port number (1-65535)')]
        [uint16[]] $Port,

        [int] $Timeout = 1000,

        [switch] $TCP,

        [switch] $UDP
    )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        if (!$tcp -AND !$udp) {
            $tcp = $True
        }
        #Typically you never do this, but in this case I felt it was for the benefit of the function
        #as any errors will be noted in the output of the report
        $oldEA = $ErrorActionPreference
        $ErrorActionPreference = 'SilentlyContinue'
        Write-Verbose -Message "Saving current value of `$ErrorActionPreference [$($oldEa)] and setting it to 'Stop'"
    }

    process {
        foreach ($c in $ComputerName) {
            foreach ($p in $port) {
                if ($tcp) {
                    #Create temporary holder
                    #$temp = '' | Select-Object -Property ComputerName, Protocol, Port, Open, Notes
                    $temp = New-Object -TypeName psobject -Property @{ Computername = ''; Protocol = ''; Port = 0; Open = $false; Notes = '' }
                    #Create object for connecting to port on computer
                    $tcpobject = New-Object -TypeName system.Net.Sockets.TcpClient
                    #Connect to remote machine's port
                    $connect = $tcpobject.BeginConnect($c, $p, $null, $null)
                    #Configure a timeout before quitting
                    $wait = $connect.AsyncWaitHandle.WaitOne($Timeout, $false)
                    #if timeout
                    if (!$wait) {
                        #Close connection
                        $tcpobject.Close()
                        Write-Verbose -Message 'Connection Timeout'
                        #Build report
                        $temp.ComputerName = $c
                        $temp.Port = $p
                        $temp.Protocol = 'TCP'
                        $temp.Open = $false
                        $temp.Notes = 'Connection to Port Timed Out'
                    } else {
                        $error.Clear()
                        $null = $tcpobject.EndConnect($connect)
                        #if error
                        if ($error[0]) {
                            #Begin making error more readable in report
                            [string] $string = ($error[0].exception).message
                            $message = (($string.split(':')[1]).replace('"', '')).TrimStart()
                            $failed = $true
                        }
                        #Close connection
                        $tcpobject.Close()
                        #if unable to query port to due failure
                        if ($failed) {
                            #Build report
                            $temp.ComputerName = $c
                            $temp.Port = $p
                            $temp.Protocol = 'TCP'
                            $temp.Open = $false
                            $temp.Notes = "$message"
                        } else {
                            #Build report
                            $temp.ComputerName = $c
                            $temp.Port = $p
                            $temp.Protocol = 'TCP'
                            $temp.Open = $true
                            $temp.Notes = "Successful link to $c $($temp.Protocol) port $p"
                        }
                    }
                    #Reset failed value
                    $failed = $Null
                    #Merge temp array with report
                    Write-Output -InputObject $temp
                }
                if ($udp) {
                    #$temp = '' | Select-Object -Property ComputerName, Protocol, Port, Open, Notes
                    $temp = New-Object -TypeName psobject -Property @{ Computername = ''; Protocol = ''; Port = 0; Open = $false; Notes = '' }
                    Write-Verbose -Message 'Making UDP connection to remote server'
                    $Socket = New-Object -TypeName Net.Sockets.Socket -ArgumentList ( 'InterNetwork', 'Dgram', 'Udp' )
                    $Socket.SendTimeOut = $Timeout  # ms
                    $Socket.ReceiveTimeOut = $Timeout  # ms
                    try {
                        $Socket.Connect( $C, $p )
                        $Buffer = New-Object -TypeName byte[] -ArgumentList 48
                        $Buffer[0] = 27
                        Write-Verbose -Message 'Sending message to remote host'
                        $null = $Socket.Send(    $Buffer )
                        $null = $Socket.Receive( $Buffer )
                        $temp.ComputerName = $c
                        $temp.Port = $p
                        $temp.Protocol = 'UDP'
                        $temp.Open = $true
                        $temp.Notes = ''
                    } catch {
                        Write-Verbose -Message 'Communication failed'
                        Write-Error -Message $error[0]
                        $temp.ComputerName = $c
                        $temp.Port = $p
                        $temp.Protocol = 'UDP'
                        $temp.Open = $false
                        $temp.Notes = $error[0].exception
                    }
                    $socket.dispose()
                    Remove-Variable -Name socket
                    #Merge temp array with report
                    Write-Output -InputObject $temp
                }
            }
        }

    }

    end {
        #Generate Report
        #Write-Output -InputObject $report
        Write-Verbose -Message "Resetting value of `$ErrorActionPreference back to [$($oldEa)]"
        $ErrorActionPreference = $oldEA
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
