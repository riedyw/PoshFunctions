function Start-ADReplication {
<#
.SYNOPSIS
    Forces replication to occur between domain controllers in domain.
.DESCRIPTION
    Forces replication to occur between domain controllers in domain. Invoke-command to a DC. Requires to be running in elevated Powershell prompt.
.PARAMETER DC
    The name, fqdn or ipaddress of a domain controller. If not specified will query AD for a domain controller.
.EXAMPLE
    Start-ADReplication

    Would return
    Running command [repadmin.exe /syncall /AdeP] on [dcname]
.EXAMPLE
    Start-ADReplication -Verbose

    Would return
    VERBOSE: Starting [Start-ADReplication]
    VERBOSE: $DC is [dcname]
    Running command [repadmin.exe /syncall /AdeP] on [dcname]
    VERBOSE: Ending Start-ADReplication
#>

    #region parameter
    [CmdletBinding(ConfirmImpact='Medium')]
    [OutputType('string')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions','')]
    Param
    (

        [Alias('DomainController')]
        [string] $DC = (Get-ADDomainController).HostName
    )

    #endregion parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "`$DC is [$DC]"
    }

    process {
        Write-Verbose -Message "Testing network connectivity to [$DC]"
        if (Test-Connection -ComputerName $dc -Count 1 -Quiet -ErrorAction silentlycontinue -Verbose:$false) {
            Write-Output -InputObject "Running command [repadmin.exe /syncall /AdeP] on [$dc]"
            Invoke-Command -ComputerName $dc -ScriptBlock { repadmin.exe /syncall /AdeP } | Out-Null
        } else {
            Write-Error -Message "The DC specified [$DC] could not be reached"
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
