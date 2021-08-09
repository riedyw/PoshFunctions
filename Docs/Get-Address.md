---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# Get-Address

## SYNOPSIS
To get the geocode (latitude, longitude) of a particular address

## SYNTAX

### String (Default)
```
Get-Address [-Coordinate] <String[]> [<CommonParameters>]
```

### Coordinates
```
Get-Address [-Latitude] <Double> [-Longitude] <Double> [<CommonParameters>]
```

## DESCRIPTION
To get the geocode (latitude, longitude) of a particular address.

## EXAMPLES

### EXAMPLE 1
```
'38.89767,-77.03655' | Get-Address | Select-Object StNumber, StAddress, City, State, Prov, Postal
```

stnumber staddress           city       state prov postal
-------- ---------           ----       ----- ---- ------
1600     PENNSYLVANIA AVE NW WASHINGTON DC    US   20500

### EXAMPLE 2
```
$Coordinate = New-Object psobject -Prop ([ordered] @{Latitude=51.51288;Longitude=0.06600})
```

$PrimeMinister = $Coordinate | Get-Address
$PrimeMinister | Select-Object StNumber, StAddress, City, State, Prov, Postal

stnumber staddress city   state prov postal
-------- --------- ----   ----- ---- ------
10       DOWNINGS  LONDON       UK   E66WP

### EXAMPLE 3
```
Get-Address -Latitude 51.51288 -Longitude 0.06600 | Select-Object StNumber, StAddress, City, State, Prov, Postal
```

stnumber staddress city   state prov postal
-------- --------- ----   ----- ---- ------
10       DOWNINGS  LONDON       UK   E66WP

## PARAMETERS

### -Coordinate
String representing the latitude and longitude coordinates of a location.
ValueFromPipeline

```yaml
Type: String[]
Parameter Sets: String
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Latitude
Latitude north or south of the equator.
Valid range -90 to 90.
Aliased to 'Lat'.
ValueFromPipeLineByPropertyName

```yaml
Type: Double
Parameter Sets: Coordinates
Aliases: Lat

Required: True
Position: 1
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Longitude
Longitude east or west of the prime meridian.
Valid range -180 to 180.
Aliased to 'Long'.
ValueFromPipeLineByPropertyName

```yaml
Type: Double
Parameter Sets: Coordinates
Aliases: Long

Required: True
Position: 2
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### psobject
## NOTES
There is a throttle limit on the number of requests that you can submit in a given time period.
Wait at least 30 seconds between each request

Inspired by: https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/geocoding-converting-lat-long-to-addresses-part-3

## RELATED LINKS
