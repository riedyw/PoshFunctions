function Get-ArpTable {
<#
.SYNOPSIS
    Gets the dynamic entries in the arp table and parses them into IPAddress and MACAddress
.DESCRIPTION
    Gets the dynamic entries in the arp table and parses them into IPAddress and MACAddress
.NOTES
    Displaying the arp table via 'arp.exe -a' produces very wordy output that is difficult to use.
    On a computer with multiple adapters and VPNs that may or may not be active can produce a lot of output.
    On my computer 'arp.exe -a' produces 74 lines of output. In the example run from the same computer it produces
    an array of 4 IPAddress/MACAddress pairs. This is useful information that can be acted against.
.EXAMPLE
    Get-ArpTable

    IPAddress     MACAddress
    ---------     ----------
    192.168.3.1   A0-40-A0-5F-BF-9C
    192.168.3.2   14-59-C0-45-CA-6A
    192.168.3.100 94-57-A5-7A-43-6D
    192.168.3.101 00-90-A9-3F-98-EF
#>

    [CmdletBinding(ConfirmImpact='None')]
    param()

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
     }

    process {
        Write-Verbose -Message "Getting arp table through 'arp.exe -a' and searching for those lines that have a MACAddress and are dynamic."
        arp.exe -a | ForEach-Object {
            if ($_ -match '([0-9a-f])\s+dynamic') {
                $_.Trim()
            }
        } | Select-Object -Unique |
        ForEach-Object {
            $tmp = $_ -split '\s+'
            New-Object -TypeName pscustomobject -Property @{ IPAddress = $tmp[0]; MACAddress = $tmp[1].ToUpper() }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
