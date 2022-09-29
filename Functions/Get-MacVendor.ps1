function Get-MacVendor {
<#
.SYNOPSIS
    Resolve MacAddresses To Vendors
.DESCRIPTION
    This Function Queries The MacVendors API With Supplied MacAdderess And Returns Manufacturer Information If A Match Is Found
.PARAMETER MacAddress
    MacAddress To Be Resolved
.EXAMPLE
    Get-MacVendor -MacAddress 00:00:00:00:00:00
.EXAMPLE
    Warning ! ! This may error due to api limits
    Get-DhcpServerv4Lease -ComputerName $ComputerName -ScopeId $ScopeId | Select -ExpandProperty ClientId | Foreach-Object {Get-MacVendor -MacAddress $_; sleep 1}

    Get-NetAdapter | select -ExpandProperty MacAddress | Foreach-Object {Get-MacVendor -MacAddress $_; sleep 1}
.EXAMPLE
    Get-MacVendor -MacAddress 00-09-0F-AA-00-01, B8-31-B5-3D-75-D1, 00-09-0F-FE-00-01, F0-6E-0B-DA-B6-A7, F0-6E-0B-DA-B6-A8

    Would return
    MacAddress        Vendor
    ----------        ------
    00-09-0F-AA-00-01 Fortinet Inc.
    B8-31-B5-3D-75-D1 Microsoft Corporation
    00-09-0F-FE-00-01 Fortinet Inc.
    F0-6E-0B-DA-B6-A7 Microsoft Corporation
    F0-6E-0B-DA-B6-A8 Microsoft Corporation
.NOTES
    Originally published as script Get-MacVendor.ps1 on PSGallery
    * added write-verbose
    * removed a-f in regex as case insensitive by default
    * added example
    * moved validate regex further into script and used Format-MacAddress to clean up addresses that don't match pattern like those seen on switches (ex. 34fcb9-c08bce)
#>

    [CmdletBinding()]
    param(
        [Parameter (Mandatory, HelpMessage='Please enter a 12 character hexadecimal MAC address optionally delimited with either : or -')]
        #[ValidatePattern('^([0-9A-F]{2}[:-]){5}([0-9A-F]{2})$')]
        [string[]] $MacAddress
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $CurrentMac = 0
    }

    process {
        foreach ($Mac in $MacAddress) {
            if ($Mac -notmatch '^([0-9A-F]{2}[:-]){5}([0-9A-F]{2})$') {
                $Mac = Format-MacAddress -MacAddress $Mac -Case Upper
            }
            $CurrentMac++
            Write-Progress -Activity "Resoving MacAddress : $Mac" -Status "$CurrentMac of $($MacAddress.Count)" -PercentComplete (($CurrentMac / $MacAddress.Count) * 100)
            try {
                Write-Verbose -Message 'Sending Request to https://api.macvendors.com/'
                # originally Invoke-RestMethod -Method Get -Uri https://api.macvendors.com/$Mac -ErrorAction SilentlyContinue
                curl.exe -s https://api.macvendors.com/$Mac | ForEach-Object {
                    New-Object -TypeName pscustomobject -Property ([ordered] @{
                        MacAddress = $Mac
                        Vendor     = $_
                    })
                }
                Start-Sleep -Milliseconds 1000
            }
            catch {
                New-Object -TypeName pscustomobject -Property ([ordered] @{
                    MacAddress = $Mac
                    Vendor     = 'UNKNOWN'
                })
                Start-Sleep -Milliseconds 1000
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
