function Get-ServiceUser {
    <#
.SYNOPSIS
    Get a list of services and the user context that they run under. By default excluded services running as system
.DESCRIPTION
    Get a list of services and the user context that they run under. By default excluded services running as system
.PARAMETER ComputerName
    An array of computer names. Defaults to $env:COMPUTERNAME. Aliased to 'CN', 'Server'
.PARAMETER UserName
    A -like search string to compare process username context. Defaults to '*'
.PARAMETER IncludeSystem
    Switch to include the system scheduled tasks. Aliased to 'IS'
.EXAMPLE
    Get-ServiceUser
.NOTES
    Unless the -IncludeSystem switch is specified the following will be excluded from the output:
        'LocalSystem',
        'NT AUTHORITY\LocalService',
        'NT AUTHORITY\NetworkService',
        'NT AUTHORITY\Network Service',
        'NT AUTHORITY\SYSTEM'
#>

    [CmdletBinding()]
    [outputtype('psobject')]
    param (
        [Alias('CN', 'Server')]
        [string[]] $ComputerName = $env:COMPUTERNAME,

        [string] $UserName = '*',

        [Alias('IS')]
        [switch] $IncludeSystem
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "ComputerName [$($ComputerName -join ', ')]"
        Write-Verbose -Message "IncludeSystem [$IncludeSystem], UserName [$UserName]"
        $ServiceAcct = @(
            'LocalSystem',
            'NT AUTHORITY\LocalService',
            'NT AUTHORITY\NetworkService',
            'NT AUTHORITY\Network Service',
            'NT AUTHORITY\SYSTEM'
        )
    }

    process {
        $Service = Get-CimInstance -ClassName Win32_Service -ComputerName $ComputerName -Verbose:$false
        if (-not $IncludeSystem) {
            $Service = $Service | Where-Object { $_.StartName -notin $ServiceAcct -and $null -ne $_.StartName }
        }
        $Service | Where-Object { $_.StartName -like $UserName } |
            Select-Object -Property @{Name = 'ComputerName'; Expr = { $_.SystemName } }, Name, DisplayName, StartName
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
