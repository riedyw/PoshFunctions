function Test-IsLocalIPv4 {
    <#
.SYNOPSIS
    Tests to determine if a specified IPv4 address is LOCAL or REMOTE (must be sent to default gateway). Aliased to 'Test-IsLocalIP'
.DESCRIPTION
    Tests to determine if a specified IPv4 address is LOCAL or REMOTE (must be sent to default gateway)
.PARAMETER Source
    The source IPv4 address [ipaddress]. Can take property values by name from the pipeline.
.PARAMETER SubnetMask
    The subnet mask in IPv4 address format [ipaddress]. Can take property values by name from the pipeline.
.PARAMETER Target
    The target IPv4 address(es) [ipaddress[]]. Can take values from the pipeline. Can take property values by name from the pipeline.
.EXAMPLE
    Test-IsLocalIPv4 -Source 10.100.10.20 -SubnetMask 255.255.255.0 -Target 10.100.10.30, 10.100.20.40 -IncludeInput

    Source       Target       SubnetMask    Local
    ------       ------       ----------    -----
    10.100.10.20 10.100.10.30 255.255.255.0  True
    10.100.10.20 10.100.20.40 255.255.255.0 False
.EXAMPLE
    Test-IsLocalIPv4 -Source 10.100.10.20 -SubnetMask 255.255.255.0 -Target 10.100.10.30

    True
.EXAMPLE
    [pscustomobject] @{ Source='10.100.10.20'; Target='10.100.20.30'; SubnetMask='255.255.255.0'} | Test-IsLocalIPv4 -IncludeInput

    Source       Target       SubnetMask    Local
    ------       ------       ----------    -----
    10.100.10.20 10.100.20.30 255.255.255.0 False
.EXAMPLE
    Test-IsLocalIPv4 -Source 10.100.10.1 -SubnetMask 255.255.0.0 -Target 10.100.20.1,10.101.10.2 -Verbose -IncludeInput

    VERBOSE: Starting [Test-IsLocalIPv4]
    VERBOSE: Source = [10.100.10.1] SubnetMask = [255.255.0.0] SourceNetwork = [10.100.0.0]
    VERBOSE: Target = [10.100.20.1] SubnetMask = [255.255.0.0] TargetNetwork = [10.100.0.0]

    VERBOSE: Target = [10.101.10.2] SubnetMask = [255.255.0.0] TargetNetwork = [10.101.0.0]
    VERBOSE: Ending [Test-IsLocalIPv4]
    Source      Target      SubnetMask  Local
    ------      ------      ----------  -----
    10.100.10.1 10.100.20.1 255.255.0.0  True
    10.100.10.1 10.101.10.2 255.255.0.0 False
#>

    #region parameter
    [CmdletBinding(ConfirmImpact = 'Low')]
    [alias('Test-IsLocalIP')] #FunctionAlias
    param
    (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ipaddress[]] $Target,

        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [ipaddress] $Source,

        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [ipaddress] $SubnetMask,

        [Switch] $IncludeInput
    )
    #endregion parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $SourceResult = $Source.Address -band $SubnetMask.Address
        Write-Verbose -Message "Source = [$($Source.IPAddressToString)] SubnetMask = [$($SubnetMask.IPAddressToString)] SourceNetwork = [$(([ipaddress] $SourceResult).IPAddressToString)]"
    }

    process {
        foreach ($curTarget in $Target) {
            $TargetResult = $curTarget.Address -band $SubnetMask.Address
            Write-Verbose -Message "Target = [$($curTarget.IPAddressToString)] SubnetMask = [$($SubnetMask.IPAddressToString)] TargetNetwork = [$(([ipaddress] $TargetResult).IPAddressToString)]"
            if ($SourceResult -eq $TargetResult) {
                $Local = $true
            } else {
                $Local = $false
            }
            if ($IncludeInput) {
                New-Object -TypeName psobject -Property ([ordered] @{
                        Source     = $Source.IPAddressToString
                        Target     = $curTarget.IPAddressToString
                        SubnetMask = $SubnetMask.IPAddressToString
                        Local      = $Local
                    })
            } else {
                Write-Output -InputObject $Local
            }
        }

    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
