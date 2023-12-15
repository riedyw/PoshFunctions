function Test-ConnectionAsync {
<#
.SYNOPSIS
    Performs a ping test asynchronously
.DESCRIPTION
    Performs a ping test asynchronously
.PARAMETER ComputerName
    List of computers to test connection. Aliased to 'CN', 'Server'
.PARAMETER Timeout
    Timeout in milliseconds. Default 2000 ms.
.PARAMETER TimeToLive
    Sets a time to live on ping request. Default 128.
.PARAMETER BufferSize
    How large you want the buffer to be. Valid range 32-65500, default of 32. If the buffer is 1501 bytes or greater then the ping can fragment.
.PARAMETER IncludeSource
    A switch determining if you want the source computer name to appear in the output
.PARAMETER Full
    A switch determining if full output appears
.NOTES
    Inspired by Test-ConnectionAsync by 'Boe Prox'
    https://gallery.technet.microsoft.com/scriptcenter/Asynchronous-Network-Ping-abdf01aa
    * fixed logic around processing pipeline
    * removed $Buffer parameter
    * added $BufferSize parameter and dynamically create $Buffer from $BufferSize
    * added $IncludeSource so that source computer would be included in output
    * added $Full so that default output is brief
    * changed datatype of .IPAddress to [version] so that it can be sorted properly
.OUTPUTS
    [pscustomobject] with output from Net.AsyncPingResult and optionally the source address
.EXAMPLE
    Test-ConnectionAsync -ComputerName server1,server2

    ComputerName IPAddress     Result
    ------------ ---------     ------
    server1      192.168.1.31 Success
    server2      192.168.1.41 Success

    Description
    -----------
    Performs asynchronous ping test against listed systems and lists brief output.
.EXAMPLE
    Test-ConnectionAsync -ComputerName server1,server2 -Full

    ComputerName IPAddress    BufferSize  Result ResponseTime
    ------------ ---------    ----------  ------ ------------
    server1      192.168.1.31         32 Success           86
    server2      192.168.1.41         32 Success           79

    Description
    -----------
    Performs asynchronous ping test against listed systems and lists full output.
.EXAMPLE
    Test-ConnectionAsync -ComputerName server1,server2 -Full -BufferSize 1500

    ComputerName IPAddress    BufferSize  Result ResponseTime
    ------------ ---------    ----------  ------ ------------
    server1      192.168.1.31       1500 Success          140
    server2      192.168.1.41       1500 Success          137

    Description
    -----------
    Performs asynchronous ping test against listed systems and lists full output with a buffersize of 1500 bytes.
#>

    #Requires -Version 3.0

    [OutputType('Net.AsyncPingResult')]
    [CmdletBinding(ConfirmImpact = 'None')]
    Param (
        [parameter(ValueFromPipeline, Position = 0)]
        [string[]] $ComputerName,

        [parameter()]
        [int] $Timeout = 2000,

        [parameter()]
        [Alias('Ttl')]
        [int] $TimeToLive = 128,

        [parameter()]
        [validaterange(32, 65500)]
        [int] $BufferSize = 32,

        [parameter()]
        [switch] $IncludeSource,

        [parameter()]
        [switch] $Full
    )

    begin {
        Write-Verbose -Message "Starting      [$($MyInvocation.Mycommand)]"
        if ($IncludeSource) { $Source = $env:COMPUTERNAME }
        $Buffer = New-Object -TypeName System.Collections.ArrayList
        1..$BufferSize | ForEach-Object { $null = $Buffer.Add(([byte] [char] 'A')) }
        $PingOptions = New-Object -TypeName System.Net.NetworkInformation.PingOptions
        $PingOptions.Ttl = $TimeToLive
        If ($BufferSize -gt 1500) {
            $DontFragment = $false
        } else {
            $DontFragment = $true
        }
        Write-Verbose -Message "ComputerName  [$($ComputerName -join ',')]"
        Write-Verbose -Message "BufferSize    [$BufferSize]"
        Write-Verbose -Message "Timeout       [$Timeout]"
        Write-Verbose -Message "TimeToLive    [$TimeToLive]"
        Write-Verbose -Message "IncludeSource [$IncludeSource]"
        Write-Verbose -Message "Full          [$Full]"
        Write-Verbose -Message "DontFragment  [$DontFragment]"
        $PingOptions.DontFragment = $DontFragment
        $Computerlist = New-Object -TypeName System.Collections.ArrayList
    }

    process {
        foreach ($Computer in $ComputerName) {
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
        try {
            [void] [Threading.Tasks.Task]::WaitAll($Task.Task)
        } catch {
            Write-Error -Message "Error checking [$Computer]"
        }
        $Task | ForEach-Object {
            if ($_.Task.IsFaulted) {
                $Result = $_.Task.Exception.InnerException.InnerException.Message
                $IPAddress = $Null
                $ResponseTime = $Null
            } else {
                $Result = $_.Task.Result.Status
                $IPAddress = $_.task.Result.Address.ToString()
                $ResponseTime = $_.task.Result.RoundtripTime
            }
            $Layout = [ordered] @{
                    ComputerName = $_.ComputerName
                    IPAddress    = if ($IPAddress) { [version] $IPAddress } else { $Null }
                    Result       = $Result
                    BufferSize   = $BufferSize
                    ResponseTime = $ResponseTime
                    DontFragment = $DontFragment
                    Timeout      = $Timeout
                    TimeToLive   = $TimeToLive
            }
            if ($IncludeSource) {
                $Layout.Insert(0,'Source',$Source)
            }
            $Object = New-Object -TypeName psobject -Property $Layout
            $Object.pstypenames.insert(0, 'Net.AsyncPingResult')
            if ($Full) {
                $Object
            } else {
                if ($IncludeSource) {
                    $Object | Select-Object -Property Source, ComputerName, IPAddress, Result
                } else {
                    $Object | Select-Object -Property ComputerName, IPAddress, Result
                }
            }
        }
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
} # EndFunction Test-ConnectionAsync
