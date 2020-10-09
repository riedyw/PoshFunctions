Function Show-ShortDaysOfWeek {
<#
.SYNOPSIS
    Show short days of the week
.DESCRIPTION
    Show short days of the week
#>

    [CmdletBinding(ConfirmImpact='None')]
    Param ()

    Begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    Process {
        Show-DaysOfWeek | foreach-object { $_.substring(0,3)}
    }

    End {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

}
