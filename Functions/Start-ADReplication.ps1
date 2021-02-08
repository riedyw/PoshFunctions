Function Start-ADReplication {
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
    Param
    (

        [Alias('DomainController')]
        [string] $DC = (Get-ADDomainController).HostName
    )

    #endregion parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        write-verbose -Message "`$DC is [$DC]"
    }

    process {
        write-verbose -Message "Testing network connectivity to [$DC]"
        if (test-connection -computername $dc -count 1 -quiet -ea silentlycontinue -verbose:$false) {
            Write-Output "Running command [repadmin.exe /syncall /AdeP] on [$dc]"
            Invoke-command -computername $dc -scriptblock { repadmin.exe /syncall /AdeP } | out-null
        } else {
            Write-Error "The DC specified [$DC] could not be reached"
        }
    }

    end {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

} #EndFunction Start-ADReplication
