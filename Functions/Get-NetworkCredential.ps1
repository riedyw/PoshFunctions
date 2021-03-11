function Get-NetworkCredential {
<#
.SYNOPSIS
    Returns a [System.Net.NetworkCredential] given a passed [PSCredential] parameter
.DESCRIPTION
    Returns a [System.Net.NetworkCredential] given a passed [PSCredential] parameter
.PARAMETER Credential
    A mandatory parameter of type [PSCredential]
.EXAMPLE
    $NetworkCredential = Get-NetworkCredential -Credential $cred
.INPUTS
    'PSCredential'
.OUTPUTS
    'System.Net.NetworkCredential'
.NOTES
    Medium to High impact as this function will return the password, albeit hidden from default view
#>

    [CmdletBinding(ConfirmImpact = 'Medium')]
    [OutputType('System.Net.NetworkCredential')]
    Param
    (
        [Parameter(Mandatory, Position = 0)]
        [PSCredential] $Credential
    )
    #endregion parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        $Credential.GetNetworkCredential()
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
