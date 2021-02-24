<#PSScriptInfo
.VERSION
    1.0.54
.GUID
    61cb130e-2c70-488b-968f-82eb57a198e5
.AUTHOR
    PM091
.DESCRIPTION
    Get-MacVendor
.COMPANYNAME
    pez863
.TAGS
    PSScript
#>

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
    Vendor                MacAddress
    ------                ----------
    Fortinet Inc.         00-09-0F-AA-00-01
    Microsoft Corporation B8-31-B5-3D-75-D1
    Fortinet Inc.         00-09-0F-FE-00-01
    Microsoft Corporation F0-6E-0B-DA-B6-A7
    Microsoft Corporation F0-6E-0B-DA-B6-A8
.NOTES
    Originally published as script Get-MacVendor.ps1 on PSGallery
    * added write-verbose
    * removed a-f in regex as case insensitive by default
    * added example
#>

    [CmdletBinding()]
    param(
        [Parameter (Mandatory)]
        [ValidatePattern('^([0-9A-F]{2}[:-]){5}([0-9A-F]{2})$')]
        [string[]] $MacAddress
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $CurrentMac = 0
    }

    process {
        foreach ($Mac in $MacAddress) {
            $CurrentMac++
            Write-Progress -Activity "Resoving MacAddress : $Mac" -Status "$CurrentMac of $($MacAddress.Count)" -PercentComplete (($CurrentMac / $MacAddress.Count) * 100)
            try {
                Write-Verbose -Message 'Sending Request to https://api.macvendors.com/'
                Invoke-RestMethod -Method Get -Uri https://api.macvendors.com/$Mac -ErrorAction SilentlyContinue | ForEach-Object {
                    [pscustomobject] @{
                        Vendor     = $_
                        MacAddress = $Mac
                    }
                }
                Start-Sleep -Milliseconds 1000
            }
            catch {
                [pscustomobject] @{
                        Vendor     = 'UNKNOWN'
                        MacAddress = $Mac
                }
                Start-Sleep -Milliseconds 1000
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
