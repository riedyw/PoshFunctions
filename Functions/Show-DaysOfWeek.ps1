Function Show-DaysOfWeek {
<#
.SYNOPSIS
    Shows the days of the week
.DESCRIPTION
    Shows the days of the week
.NOTES
    Author:     Bill Riedy
.OUTPUTS
    [string[]]
#>

    [CmdletBinding(ConfirmImpact='None')]
    [outputtype([string[]])]
    Param ()

    Begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    Process {
        [System.Enum]::GetNames( [System.DayOfWeek] )
    }

    End {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

}
