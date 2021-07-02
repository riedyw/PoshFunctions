function Get-Address {
<#
.SYNOPSIS
    To get the geocode (latitude, longitude) of a particular address
.DESCRIPTION
    To get the geocode (latitude, longitude) of a particular address.
.PARAMETER Coordinate
    String representing the latitude and longitude coordinates of a location. ValueFromPipeline
.PARAMETER Latitude
    Latitude north or south of the equator. Valid range -90 to 90. Aliased to 'Lat'. ValueFromPipeLineByPropertyName
.PARAMETER Longitude
    Longitude east or west of the prime meridian. Valid range -180 to 180. Aliased to 'Long'. ValueFromPipeLineByPropertyName
.EXAMPLE
    '38.89767,-77.03655' | Get-Address | Select-Object StNumber, StAddress, City, State, Prov, Postal

    stnumber staddress           city       state prov postal
    -------- ---------           ----       ----- ---- ------
    1600     PENNSYLVANIA AVE NW WASHINGTON DC    US   20500
.EXAMPLE
    $Coordinate = New-Object psobject -Prop ([ordered] @{Latitude=51.51288;Longitude=0.06600})
    $PrimeMinister = $Coordinate | Get-Address
    $PrimeMinister | Select-Object StNumber, StAddress, City, State, Prov, Postal

    stnumber staddress city   state prov postal
    -------- --------- ----   ----- ---- ------
    10       DOWNINGS  LONDON       UK   E66WP
.EXAMPLE
    Get-Address -Latitude 51.51288 -Longitude 0.06600 | Select-Object StNumber, StAddress, City, State, Prov, Postal

    stnumber staddress city   state prov postal
    -------- --------- ----   ----- ---- ------
    10       DOWNINGS  LONDON       UK   E66WP
.NOTES
    There is a throttle limit on the number of requests that you can submit in a given time period. Wait at least 30 seconds between each request

    Inspired by: https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/geocoding-converting-lat-long-to-addresses-part-3
#>

    #region parameter
    [CmdletBinding(DefaultParameterSetName='String', ConfirmImpact = 'None')]
    [OutputType('psobject')]
    Param (
        [Parameter(Mandatory, HelpMessage="Please enter a coordinate string in the form 'latitude,longitude'", Position = 0, ParameterSetName = 'String', ValueFromPipeline)]
        [string[]] $Coordinate,


        [Parameter(Mandatory, HelpMessage='Please enter a latitude (min -90, max +90)', Position = 0, ParameterSetName = 'Coordinates', ValueFromPipeLineByPropertyName)]
        [ValidateRange(-90,90)]
        [Alias('Lat')]
        [double] $Latitude,

        [Parameter(Mandatory, HelpMessage='Please enter a longitude (min -180, max +190)', Position = 1, ParameterSetName = 'Coordinates', ValueFromPipeLineByPropertyName)]
        [ValidateRange(-180,180)]
        [Alias('Long')]
        [double] $Longitude
    )
    #endregion parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $url='https://geocode.xyz'
        $null = Invoke-RestMethod -Uri $url -SessionVariable session
    }

    process {
        if ($PsCmdlet.ParameterSetName -eq 'String') {
            foreach ($currentCoordinate in $Coordinate) {
                Invoke-RestMethod -Uri "$url/$currentCoordinate?geoit=json" -WebSession $session
            }
        } else {
            $currentCoordinate = "$Latitude,$Longitude"
            Invoke-RestMethod -Uri "$url/$currentCoordinate?geoit=json" -WebSession $session
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
