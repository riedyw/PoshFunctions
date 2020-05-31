Function Show-ShortMonth {
<#
.SYNOPSIS
    Shows short month
.DESCRIPTION
    Shows short month
.NOTES
    Author:     Bill Riedy
#>



    [CmdletBinding(ConfirmImpact='None')]
    Param ()

    Begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    Process {
        [System.Globalization.DateTimeFormatInfo]::CurrentInfo.AbbreviatedMonthNames
    }

    End {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

}
