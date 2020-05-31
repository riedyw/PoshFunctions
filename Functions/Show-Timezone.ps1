Function Show-Timezone {
<#
.SYNOPSIS
    Show timezone information
.DESCRIPTION
    Show timezone information
.NOTES
    Author:     Bill Riedy
#>

    [CmdletBinding(ConfirmImpact='None')]
    Param ()

    Begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    Process {
        [object] [System.TimeZoneInfo]::GetSystemTimeZones()
    }

    End {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

}
