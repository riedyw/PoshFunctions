Function Show-Timezone {
<#
.SYNOPSIS
    Show timezone information
.DESCRIPTION
    Show timezone information
#>

# todo rename Get-AllTimezone, function alias, update readme

    [CmdletBinding(ConfirmImpact='None')]
    Param ()

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        [object] [System.TimeZoneInfo]::GetSystemTimeZones()
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
