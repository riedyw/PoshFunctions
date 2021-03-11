function Get-GeoCode {
<#
.SYNOPSIS
    To get the geocode (latitude, longitude) of a particular address
.DESCRIPTION
    To get the geocode (latitude, longitude) of a particular address. Defaults output as an object, can specify a switch to output as a string
.PARAMETER Address
    Mandatory string which is the address to lookup
.PARAMETER AsString
    Switch to make the output appear as a string
.EXAMPLE
    Get-GeoCode -Address '1600 Pennsylvania Ave NW, Washington DC'

    Latitude Longitude
    -------- ---------
    38.89767 -77.03655
.EXAMPLE
    Get-GeoCode -Address '1600 Pennsylvania Ave NW, Washington DC' -AsString

    38.89767,-77.03655
.EXAMPLE
    Get-GeoCode -Address '10 Downing St, London UK'

    Latitude Longitude
    -------- ---------
    51.51288 0.06600
.NOTES
    There is a throttle limit on the number of requests that you can submit in a given time period. Wait at least 30 seconds between each request

    Inspired by: https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/geocoding-converting-addresses-to-lat-long-part-2?CommentId=767cd85b-6f1b-475a-a419-d894f487ca87
#>

    #region parameter
    [CmdletBinding(ConfirmImpact = 'None')]
    [OutputType('psobject')]
    Param (

        [Parameter(Mandatory, HelpMessage='Please enter an address')]
        [string] $Address,

        [switch] $AsString
    )
    #endregion parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        $AddressEncoded = [System.Net.WebUtility]::UrlEncode($Address)
        $null = Invoke-RestMethod -SessionVariable session -Uri "https://geocode.xyz"
        $data = Invoke-RestMethod -WebSession $session -Uri "https://geocode.xyz/${AddressEncoded}?json=1"
        if ($null -ne $data.error) {
             throw "Address not found. $($data.Error.Description)"
        }
        if (-not $AsString) {
            [PSCustomObject] ([ordered] @{
                 Latitude = $data.latt
                 Longitude = $data.longt
            })
        } else {
            Write-Output -InputObject (@($data.latt,$data.longt) -join ',')
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
