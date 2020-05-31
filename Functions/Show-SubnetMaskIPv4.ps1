Function Show-SubnetMaskIPv4 {
<#
.SYNOPSIS
    Show IPv4 subnet masks
.DESCRIPTION
    Show IPv4 subnet masks
.NOTES
    Author:     Bill Riedy
#>



    [CmdletBinding(ConfirmImpact='None')]
    Param ()

    Begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    Process {
        1..32 | Get-SubnetMaskIPv4 -IncludeCIDR
    }

    End {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

}

Set-Alias -Name 'Show-SubnetMaskIP' -Value 'Show-SubnetMaskIPv4'
