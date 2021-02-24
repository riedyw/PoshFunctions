function Show-SubnetMaskIPv4 {
<#
.SYNOPSIS
    Show IPv4 subnet masks
.DESCRIPTION
    Show IPv4 subnet masks
#>



    [CmdletBinding(ConfirmImpact='None')]
    Param ()

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        1..32 | Get-SubnetMaskIPv4 -IncludeCIDR
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}

Set-Alias -Name 'Show-SubnetMaskIP' -Value 'Show-SubnetMaskIPv4' -Description 'Alias for Show-SubnetMaskIPv4'
