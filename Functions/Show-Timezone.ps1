Function Show-Timezone {
<#
.SYNOPSIS
    Show timezone information
.DESCRIPTION
    Show timezone information
#>

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
