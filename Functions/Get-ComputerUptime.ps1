function Get-ComputerUptime {
<#
.SYNOPSIS
    To mimic and extend the Get-ComputerUptime function found in PowerShell 6 or 7
.DESCRIPTION
    To mimic and extend the Get-ComputerUptime function found in PowerShell 6 or 7.
    Function aliased to 'Get-LastReboot' for backward compatibility
.PARAMETER Since
    Switch to show last boot time, not the timespan since last boot
.PARAMETER ComputerName
    String array of computers to check uptime against. If not given or is '.' it is replaced with $env:COMPUTERNAME.
    Aliased to 'CN', 'Server'
.PARAMETER IncludeComputerName
    Switch on whether to include the computer name in the output
.EXAMPLE
    Get-ComputerUptime

    Days              : 0
    Hours             : 8
    Minutes           : 20
    Seconds           : 37
    Milliseconds      : 306
    Ticks             : 300373061593
    TotalDays         : 0.34765400647338
    TotalHours        : 8.34369615536111
    TotalMinutes      : 500.621769321667
    TotalSeconds      : 30037.3061593
    TotalMilliseconds : 30037306.1593
.EXAMPLE
    Get-ComputerUptime -Since

    Sunday, February 28, 2021 12:47:04 PM
.EXAMPLE
    Get-ComputerUptime -IncludeComputerName -Since

    ComputerName LastBoot
    ------------ --------
    DemoLaptop   3/16/2021 12:59:24 PM
.EXAMPLE
    Get-ComputerUptime -IncludeComputerName -Since -ComputerName server1, server2

    ComputerName LastBoot
    ------------ --------
    server1      3/18/2021 10:58:53 PM
    server2      3/17/2021 1:50:49 PM
.NOTES
    To mimic and extend the functionality of the Get-Uptime function found in PowerShell 6 or 7

    Put in error checking around Get-CimInstance to handle Kerberos errors.
#>

    # todo - add Credential to New-CimSession

    #region Parameter
    [CmdletBinding(ConfirmImpact = 'Low')]
    [alias('Get-LastReboot')] #FunctionAlias
    [OutputType('psobject')]
    Param(
        [switch] $Since,

        [parameter(ValueFromPipelineByPropertyName)]
        [Alias('ComputerName', 'CN', 'Server')]
        [string[]] $Name = $env:COMPUTERNAME,

        [switch] $IncludeComputerName,

        [System.Management.Automation.PSCredential] $Credential
    )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        if ($Name -eq '.') {
            $Name = $env:COMPUTERNAME
            Write-Verbose -Message "Setting `$Name to [$Name]"
        }
        $CimOption = New-CimSessionOption -EncodePortInServicePrincipalName -Encoding Default
    }

    process {
        foreach ($CurName in $Name) {
            Write-Verbose -Message "Processing [$CurName]"
            try {
                if ($Credential) {
                    $CimSession = New-CimSession -ComputerName $CurName -Credential $Credential
                    $LastBootUpTime = (Get-CimInstance -ClassName Win32_OperatingSystem -CimSession $CimSession -ErrorAction Stop -Verbose:$false).LastBootUpTime
                } else {
                    $LastBootUpTime = (Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName $CurName -ErrorAction Stop -Verbose:$false).LastBootUpTime
                }
            } catch {
                try {
                    $CimSession = New-CimSession -ComputerName $CurName -SessionOption $CimOption
                    $LastBootUpTime = (Get-CimInstance -ClassName Win32_OperatingSystem -CimSession $CimSession -ErrorAction Stop -Verbose:$false).LastBootUpTime
                    $CimSession.Close()
                    $CimSession.Dispose()
                } catch {
                    Write-Error -Message "Either computer [$CurName] is not up, or you don't have permission to read from WMI objects."
                }
            }
            if ($Since) {
                if ($IncludeComputerName) {
                    New-Object -TypeName psobject -Property ([ordered] @{
                            ComputerName = $CurName
                            LastBoot     = $LastBootUpTime
                        })
                } else {
                    Write-Output -InputObject $LastBootUpTime
                }
            } else {
                $TimeSpan = ((Get-Date) - $LastBootUpTime)
                if ($IncludeComputerName) {
                    $TimeSpan | Add-Member -MemberType NoteProperty -Name ComputerName -Value $CurName
                }
                Write-Output -InputObject ($TimeSpan | Select-Object -Property *)
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
