function Get-ProcessUser {
    <#
.SYNOPSIS
    Get a list of processes and the user context that they run under. By default excluded system tasks
.DESCRIPTION
    Get a list of processes and the user context that they run under. By default excluded system tasks
.PARAMETER ComputerName
    An array of computer names. Defaults to $env:COMPUTERNAME. Aliased to 'CN', 'Server'
.PARAMETER UserName
    A -like search string to compare process username context. Defaults to '*'
.PARAMETER IncludeSystem
    Switch to include the system scheduled tasks. Aliased to 'IS'
.NOTES
    Unless the -IncludeSystem switch is specified the following will be excluded from the output:
        'NT Authority\System',
        'NT Authority\Local Service',
        'NT Authority\Network Service'
#>

    [CmdletBinding()]
    [outputtype('psobject')]
    param (
        [Alias('CN', 'Server')]
        [string[]] $ComputerName = $env:COMPUTERNAME,

        [string] $UserName = '*',

        [switch] $IncludeSystem

    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "ComputerName [$($ComputerName -join ', ')]"
        Write-Verbose -Message "IncludeSystem [$IncludeSystem], UserName [$UserName]"
        $System = @(
            'NT AUTHORITY\SYSTEM',
            'NT AUTHORITY\LOCAL SERVICE',
            'NT AUTHORITY\NETWORK SERVICE'
        )
    }

    process {
        $Proc = Invoke-Command -ComputerName $ComputerName -ScriptBlock { Get-Process -IncludeUserName } |
            Where-Object { $_.UserName -like $UserName }
        if (-not $IncludeSystem) {
            $Proc = $Proc | Where-Object { $_.UserName -notin $System -and $null -ne $_.UserName }
        }
        $Proc |  Select-Object -Property @{Name = 'ComputerName'; expr = { $_.PsComputerName } }, UserName, Name, Id
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
