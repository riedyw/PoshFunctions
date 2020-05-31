Function Get-Share {
<#
.SYNOPSIS
    To get information about shares on the local computer
.DESCRIPTION
    To get information about shares on the local computer
.PARAMETER ShareName
    The name or partial name of the share. No wildcards are needed.
.PARAMETER IgnoreAdmin
    To ignore any default admin shares such as Admin$, C$, IPC$
.PARAMETER Types
    A string, or an array of the types of shares you want to view. Valid types include: Disk, Print, DiskAdmin, PrintAdmin, IPCAdmin, Device, DeviceAdmin
.NOTES
    Author:     Bill Riedy
    Version:    1.0
    Date:       2018/03/15
    Notes:      Added functionality to test if Powershell version 2 as that does not have -in or -notin operators
.EXAMPLE
    Get-Share
    Would return:
    A listing of all of the shares
.EXAMPLE
    Get-Share -ShareName "My"
    Would return:
    A listing of all of the shares that contain the string "My"
.EXAMPLE
    Get-Share -ShareName -IgnoreAdmin
    Would return:
    A listing of all of the shares minus the automatic Admin shares
.OUTPUTS
    An array of objects containing the fields ComputerName, ShareName, Path, Type, Status
#>

    [CmdletBinding()]
    Param (
        [parameter(ValueFromPipeLine,ValueFromPipeLineByPropertyName)]
        [string] $ShareName = '*',

        [parameter()]
        [switch] $IgnoreAdmin,

        [parameter()]
        [array] $Types
    )

    # Initialize
    $oldEA = $ErrorActionPreference
    $ErrorActionPreference = 'continue'
    write-verbose -message "Saving current value of `$ErrorActionPreference [$($oldEa)] and setting it to 'Continue'"
    if ($ShareName -eq '*') { $ShareName = '' }
    try {
        write-verbose -message 'Querying CIM for a list of shares'
        [Array] $Shares = Get-CimInstance -Class win32_share -Filter "Name Like '%$ShareName%'" |
            select-object -Property @{label = 'ComputerName'; expression = {$_.pscomputername}}, @{label = 'ShareName'; expression = {$_.name}},
                 Path, Type, Status
    } catch {
        write-verbose -message 'Error running Get-CimInstance permissions problem'
        write-error -message 'Get-CimInstance error'
        return
    }
    if ($IgnoreAdmin) {
        write-verbose -message 'Removing admin shares'
        [array] $ignoreShares = 'Admin$', 'IPC$', 'Print$'
        # add hidden shares for all drive letters A-Z Ansi codes 65-90
        65..90 | foreach-object { $ignoreShares += "$([char] $_)$" }
        $shares = $shares | Where-Object { $ignoreShares -notcontains $_.ShareName  }
            #$Command = '$shares | Where-Object { $_.ShareName -notin $ignoreShares }'
            #invoke-expression -command $Command

    }
    # Decode the type numbers into human readable form
    write-verbose -message 'Decoding numeric share types to human readable form'
    $shares | foreach-object { $current = $_
        switch ($current.type) {
            0           {$current.type = 'Disk'}
            1           {$current.type = 'Print'}
            2           {$current.type = 'Device'}
            3           {$current.type = 'IPC'}
            2147483648  {$current.type = 'DiskAdmin'}
            2147483649  {$current.type = 'PrintAdmin'}
            2147483650  {$current.type = 'DeviceAdmin'}
            2147483651  {$current.type = 'IPCAdmin'}
        }
    }
    if ($Types) {
        write-verbose -message 'Showing only those specified in $Types argument'
        if ($PsVersionTable.psversion.major -lt 3) {
            $shares = $shares | where-object { get-in -ItemToFind ($_.Type) -ListToSearch $Types -in }
        } else {
            $Shares = $Shares | where-object { $Types -contains $_.type }
            #$Command = '$Shares = $Shares | where-object { $_.type -in $Types}'
            #invoke-expression -command $Command
        }
    }
    write-verbose -message "Resetting value of `$ErrorActionPreference back to [$($oldEa)]"
    $ErrorActionPreference = $oldEA
    write-output -inputobject $shares
    # cleanup
} #EndFunction Get-Share
