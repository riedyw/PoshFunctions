function Get-MyLocalLogonTime {
    <#
.SYNOPSIS
    Gets local logon time for the current user
.DESCRIPTION
    Gets local logon time for the current user
.PARAMETER Detail
    Switch to include detail in output. If not specified just the logon time is returned.
.EXAMPLE
    Get-MyLocalLogonTime

    Friday, July 30, 2021 7:54:36 AM
.EXAMPLE
    Get-MyLocalLogonTime -Detail

    User               ComputerName LocalLogonTime
    ----               ------------ --------------
    contosco\testuser  demolaptop   7/30/2021 7:54:36 AM
.NOTES
    Inspired by: https://community.idera.com/database-tools/powershell/script_library/m/local-accounts/30450
#>

    [CmdletBinding()]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseCmdletCorrectly', '')]
    param (
        [switch] $Detail
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        $RegKey = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\$([Security.Principal.WindowsIdentity]::GetCurrent().User.Value)"
        Write-Verbose -Message "Getting logon time information from [$RegKey]"
        $Raw = Get-ItemProperty -Path $RegKey -Verbose:$false
        Write-Verbose -Message "Converting logon time values to datetime"
        $LocalLogonTime = ConvertTo-DateTime -DateString ([uint64] ($Raw.LocalProfileLoadTimeHigh * (Get-Power -Base 2 -Power 32)) + $Raw.LocalProfileLoadTimeLow) -FileTime -Verbose:$false

        if (-not $Detail) {
            $LocalLogonTime
        } else {
            New-Object -TypeName psobject -Property ([ordered] @{
                    User           = ([Environment]::UserDomainName + '\' + [Environment]::UserName)
                    ComputerName   = $env:COMPUTERNAME
                    LocalLogonTime = $LocalLogonTime
                })
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
