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
#>
    [CmdletBinding()]
    param(
        [Parameter (Mandatory,HelpMessage='Add help message for user',
            ValueFromPipeline = $false)]
        [ValidatePattern('^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$')]
        [string[]]$MacAddress
    )

    begin {
        $CurrentMac = 0
    }

    process {
        foreach ($Mac in $MacAddress) {
            $CurrentMac++
            Write-Progress -Activity "Resoving MacAddress : $Mac" -Status "$CurrentMac of $($MacAddress.Count)" -PercentComplete (($CurrentMac / $MacAddress.Count) * 100)
            try {
                Write-Verbose -Message 'Sending Request to https://api.macvendors.com/'
                Invoke-RestMethod -Method Get -Uri https://api.macvendors.com/$Mac -ErrorAction SilentlyContinue | Foreach-object {
                    [pscustomobject]@{
                        Vendor     = $_
                        MacAddress = $Mac
                    }
                }
                Start-Sleep -Milliseconds 1000
            }
            catch {
                [pscustomobject]@{
                        Vendor     = 'UNKNOWN'
                        MacAddress = $Mac
                }
                Start-Sleep -Milliseconds 1000
            }
        }
    }

    end {

    }

}
