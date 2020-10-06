Function Show-Month {
<#
.SYNOPSIS
    Shows the months
.DESCRIPTION
    Shows the months
#>



    [CmdletBinding(ConfirmImpact='None')]
    Param ()

    Begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    Process {
        0..11 |
            ForEach-Object { [Globalization.DatetimeFormatInfo]::CurrentInfo.MonthNames[$_] }
    }

    End {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

}
