function Test-Network {
    <#
.SYNOPSIS
    Wrapper function for Get-IpRange, Test-ConnectionAsync, and Get-DNSHostEntryAsync to give summary table of ip addresses that either resolve to a host name or respond to a ping
.DESCRIPTION
    Wrapper function for Get-IpRange, Test-ConnectionAsync, and Get-DNSHostEntryAsync to give summary table of ip addresses that either resolve to a host name or respond to a ping
.PARAMETER Subnet
    A string or string array of subnets listed in CIDR format (e.g. 10.100.10.0/24). Can either be specified with -Subnet parameter or fed from the pipeline
.EXAMPLE
    '10.100.40.0/29' | Test-Network

    IpAddress   ComputerName                Result
    ---------   ------------                ------
    10.100.40.1 UNKNOWN                    Success
    10.100.40.2 UNKNOWN                    Success
    10.100.40.3 server-102094.contosco.com Success
    10.100.40.4 server-101811.contosco.com Success
    10.100.40.5 server-102372.contosco.com TimeOut
    10.100.40.6 server-101875.contosco.com Success
#>

    [cmdletbinding()]
    param(
        [Parameter(Mandatory,HelpMessage='Please enter a network in CIDR format (ex. 192.168.1.0/24)', Position = 0, ValueFromPipeline)]
        [string[]] $Subnet
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($curSubnet in $Subnet) {
            Write-Verbose -Message "Getting ip addresses in range [$curSubnet]"
            $net = Get-IpRange -Subnet $curSubnet -Verbose:$false
            Write-Verbose -Message "Testing connectivity to [$($net.count)] ip addresses in range [$curSubnet]"
            $result = Test-ConnectionAsync -ComputerName $net -Timeout 5000 -ErrorAction SilentlyContinue  -Verbose:$false |
            Select-Object -Property @{Name = 'IpAddress'; Expr = { $_.ComputerName } }, @{Name = 'ComputerName'; Expr = { $null } }, Result
            Write-Verbose -Message "Getting host names to [$($net.count)] ip addresses in range [$curSubnet]"
            $Name = Get-DNSHostEntryAsync -ComputerName $net -ErrorAction SilentlyContinue  -Verbose:$false
            Write-Verbose 'Consolidating data'
            foreach ($curResult in $Result) {
                $tmp = $Name | Where-Object { $_.ComputerName -eq $curResult.IpAddress }
                if ($tmp) {
                    if ($tmp.Result -eq 'No such host is known') {
                        $curResult.ComputerName = 'UNKNOWN'
                    } else {
                        $curResult.ComputerName = $tmp.Result.ToLower()
                    }
                }
                if ($curResult.Result -ne 'Success') {
                    $curResult.Result = 'TimeOut'
                }
            }
            $result = $result | Where-Object { -not ($_.ComputerName -eq 'UNKNOWN' -and $_.Result -eq 'TimeOut') }
            Write-Output -InputObject $result
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
