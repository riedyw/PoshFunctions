Function ConvertTo-SecureText {

<#
.SYNOPSIS
Performs a ping test asynchronously
.DESCRIPTION
Performs a ping test asynchronously
.PARAMETER Computername
List of computers to test connection
.PARAMETER Timeout
Timeout in milliseconds. Default 2000 ms.
.PARAMETER TimeToLive
Sets a time to live on ping request.
.PARAMETER Fragment
Tells whether to fragment the request
.PARAMETER BufferSize
How large you want the buffer to be. Valid range 32-1500
.PARAMETER IncludeSource
A switch determining if you want the source computer name to appear in the output
.NOTES
Inspired by Test-ConnectionAsync by 'Boe Prox'
https://gallery.technet.microsoft.com/scriptcenter/Asynchronous-Network-Ping-abdf01aa
* fixed logic around processing pipeline
* removed $Buffer parameter
* added $BufferSize parameter and dynamically create $Buffer from $BufferSize
* added $IncludeSource so that source computer would be included in output
.OUTPUT
Net.AsyncPingResult
.EXAMPLE
Test-ConnectionAsync -Computername server1,server2

Computername IPAddress    BufferSize  Result ResponseTime
------------ ---------    ----------  ------ ------------
server1      192.168.1.31         32 Success           86
server2      192.168.1.41         32 Success           79

Description
-----------
Performs asynchronous ping test against listed systems.
#>

    [CmdletBinding()]
    [OutputType('string')]
    Param (
        [parameter(ValueFromPipeLine=$True,ValueFromPipeLineByPropertyName=$True)]
        [Alias('Ask')]
        [string] $Prompt = 'Please enter text'
    )

    begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    } #close begin block

    process {
        $secure = Read-Host -AsSecureString  -Prompt "$Prompt"
        $encrypted = ConvertFrom-SecureString -SecureString $secure
        $encrypted
    }

    end {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    } #close end block

} #EndFunction ConvertTo-SecureText
