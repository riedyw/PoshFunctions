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

    Put in error checking around Invoke-Command to handle Kerberos errors.
#>

    # todo - add Credential to invoke-command

    [CmdletBinding()]
    [OutputType('psobject')]
    param (
        [parameter(Mandatory, HelpMessage = 'Please enter the name of a computer', ValueFromPipelineByPropertyName)]
        [Alias('ComputerName', 'CN', 'Server')]
        [string[]] $Name,

        [string] $UserName = '*',

        [switch] $IncludeSystem

    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "IncludeSystem [$IncludeSystem], UserName [$UserName]"
        if ($Name -eq '.') {
            $Name = $env:COMPUTERNAME
            Write-Verbose -Message "Setting `$Name to [$Name]"
        }
        $System = @(
            'NT AUTHORITY\SYSTEM',
            'NT AUTHORITY\LOCAL SERVICE',
            'NT AUTHORITY\NETWORK SERVICE'
        )
        $PssOption = New-PSSessionOption -IncludePortInSPN
    }

    process {
        foreach ($CurName in $Name) {
            Write-Verbose -Message "Processing [$CurName]"
            try {
                $Proc = Invoke-Command -ComputerName $CurName -ScriptBlock { Get-Process -IncludeUserName } | Where-Object { $_.UserName -like $UserName }
            } catch {
                try {
                    $PsSession = New-PSSession -ComputerName $CurName -SessionOption $PssOption
                    Invoke-Command -Session $PsSession -ScriptBlock { Get-Process -IncludeUserName } | Where-Object { $_.UserName -like $UserName }
                } catch {
                    Write-Error -Message "Either computer [$curComputerName] is not up, or you don't have permission to run Invoke-Command against [$curComputerName]"
                }
            }
            if (-not $IncludeSystem) {
                $Proc = $Proc | Where-Object { $_.UserName -notin $System -and $null -ne $_.UserName }
            }
            $Proc |  Select-Object -Property @{Name = 'ComputerName'; expr = { $_.PsComputerName } }, UserName, Name, Id
         }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
