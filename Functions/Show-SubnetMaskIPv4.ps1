function Show-SubnetMaskIPv4 {
<#
.SYNOPSIS
    Show IPv4 subnet masks
.DESCRIPTION
    Show IPv4 subnet masks. Function aliased to 'Show-SubnetMaskIP'
#>



    [CmdletBinding(ConfirmImpact='None')]
    [alias('Show-SubnetMaskIP')]
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
