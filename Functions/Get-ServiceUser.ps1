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

    # todo - add Credential
    # todo Change += to System.Collections.Arraylist

    [CmdletBinding()]
    [OutputType('psobject')]
    param (
        [parameter(Mandatory, HelpMessage = 'Please enter the name of a computer', ValueFromPipelineByPropertyName)]
        [Alias('ComputerName', 'CN', 'Server')]
        [string[]] $Name,

        [string] $UserName = '*',

        [Alias('IS')]
        [switch] $IncludeSystem
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        if ($Name -eq '.') {
            $Name = $env:COMPUTERNAME
            Write-Verbose -Message "Setting `$Name to [$Name]"
        }
        Write-Verbose -Message "IncludeSystem [$IncludeSystem], UserName [$UserName]"
        $ServiceAcct = @(
            'LocalSystem',
            'NT AUTHORITY\LocalService',
            'NT AUTHORITY\NetworkService',
            'NT AUTHORITY\Network Service',
            'NT AUTHORITY\SYSTEM'
        )
        $ReturnVal = @()
        $CimOption = New-CimSessionOption -EncodePortInServicePrincipalName
    }

    process {
        foreach ($CurComputer in $Name) {
            Write-Verbose -Message "Processing [$CurComputer]"
            try {
                $Service = Get-CimInstance -ClassName Win32_Service -ComputerName $CurComputer -Verbose:$false
                if (-not $IncludeSystem) {
                    $Service = $Service | Where-Object { $_.StartName -notin $ServiceAcct -and $null -ne $_.StartName }
                }
                $ReturnVal += $Service | Where-Object { $_.StartName -like $UserName } |
                    Select-Object -Property @{Name = 'ComputerName'; Expr = { $_.SystemName } }, Name, DisplayName, StartName
            } catch {
                try {
                    $CimSession = New-CimSession -ComputerName $curComputer -SessionOption $CimOption
                    $Service = Get-CimInstance -ClassName Win32_Service -CimSession $CimSession -Verbose:$false
                    if (-not $IncludeSystem) {
                        $Service = $Service | Where-Object { $_.StartName -notin $ServiceAcct -and $null -ne $_.StartName }
                    }
                    $ReturnVal += $Service | Where-Object { $_.StartName -like $UserName } |
                        Select-Object -Property @{Name = 'ComputerName'; Expr = { $_.SystemName } }, Name, DisplayName, StartName
                } catch {
                    Write-Error -Message "Either computer [$curComputerName] is not up, or you don't have permission to read from WMI objects."
                }
            }

        }
    }

    end {
        if ($ReturnVal) {
            $ReturnVal
        }
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
