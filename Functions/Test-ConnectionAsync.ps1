Function Test-ConnectionAsync {
<#
.SYNOPSIS
    Performs a ping test asynchronously
.DESCRIPTION
    Performs a ping test asynchronously
.PARAMETER ComputerName
    List of computers to test connection
.PARAMETER Timeout
    Timeout in milliseconds. Default 2000 ms.
.PARAMETER TimeToLive
    Sets a time to live on ping request. Default 128.
.PARAMETER Fragment
    Switch that determine if request can be fragmented
.PARAMETER BufferSize
    How large you want the buffer to be. Valid range 32-1500, default of 32.
.PARAMETER IncludeSource
    A switch determining if you want the source computer name to appear in the output
.NOTES
    Inspired by Test-ConnectionAsync by 'Boe Prox'
    https://gallery.technet.microsoft.com/scriptcenter/Asynchronous-Network-Ping-abdf01aa
    * fixed logic around processing pipeline
    * removed $Buffer parameter
    * added $BufferSize parameter and dynamically create $Buffer from $BufferSize
    * added $IncludeSource so that source computer would be included in output
.OUTPUTS
    Net.AsyncPingResult
.EXAMPLE
    Test-ConnectionAsync -ComputerName server1,server2

    ComputerName IPAddress    BufferSize  Result ResponseTime
    ------------ ---------    ----------  ------ ------------
    server1      192.168.1.31         32 Success           86
    server2      192.168.1.41         32 Success           79

    Description
    -----------
    Performs asynchronous ping test against listed systems.
#>

    #Requires -Version 3.0

    [OutputType('Net.AsyncPingResult')]
    [CmdletBinding(ConfirmImpact='None')]
    Param (
        [parameter(ValueFromPipeline,Position=0)]
        [string[]] $ComputerName,

        [parameter()]
        [int32] $Timeout = 2000,

        [parameter()]
        [Alias('Ttl')]
        [int32] $TimeToLive = 128,

        [parameter()]
        [switch] $Fragment,

        [parameter()]
        [validaterange(32,1500)]
        [int16] $BufferSize = 32,

        [parameter()]
        [switch] $IncludeSource
    )

    begin {
        if ($IncludeSource) { $Source = $env:COMPUTERNAME }

        $Buffer = New-Object -TypeName System.Collections.ArrayList
        1..$BufferSize | foreach-object { $null = $Buffer.Add(([byte] [char] 'A')) }
        $PingOptions = New-Object -TypeName System.Net.NetworkInformation.PingOptions
        $PingOptions.Ttl = $TimeToLive
        If (-NOT $PSBoundParameters.ContainsKey('Fragment')) {
            $Fragment = $False
        }
        $PingOptions.DontFragment = $Fragment
        $Computerlist = New-Object -TypeName System.Collections.ArrayList
    }

    process {
        ForEach ($Computer in $ComputerName) {
            [void] $Computerlist.Add($Computer)
            }
    }

    end {
        $Task = foreach ($Computer in $ComputerList) {
            [pscustomobject] @{
                ComputerName = $Computer
                Task         = (New-Object -TypeName System.Net.NetworkInformation.Ping).SendPingAsync($Computer, $Timeout, $Buffer, $PingOptions)
            }
        }
        Try {
            [void][Threading.Tasks.Task]::WaitAll($Task.Task)
        } Catch {
            Write-Error -Message "Error checking [$Computer]"
        }
        $Task | ForEach-Object {
            If ($_.Task.IsFaulted) {
                $Result = $_.Task.Exception.InnerException.InnerException.Message
                $IPAddress = $Null
                $ResponseTime = $Null
            } Else {
                $Result = $_.Task.Result.Status
                $IPAddress = $_.task.Result.Address.ToString()
                $ResponseTime = $_.task.Result.RoundtripTime
            }
            if ($IncludeSource) {
                $Object = [pscustomobject] @{
                    Source       = $Source
                    ComputerName = $_.ComputerName
                    IPAddress    = $IPAddress
                    BufferSize   = $BufferSize
                    Result       = $Result
                    ResponseTime = $ResponseTime
                }
            } else {
                $Object = [pscustomobject]@{
                    ComputerName = $_.ComputerName
                    IPAddress    = $IPAddress
                    BufferSize   = $BufferSize
                    Result       = $Result
                    ResponseTime = $ResponseTime
                }
            }
            $Object.pstypenames.insert(0, 'Net.AsyncPingResult')
            $Object
        }
    }
}
