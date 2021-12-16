---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# Get-GeoCode

## SYNOPSIS
To get the geocode (latitude, longitude) of a particular address

## SYNTAX

```
Get-GeoCode [-Address] <String> [-AsString] [<CommonParameters>]
```

## DESCRIPTION
To get the geocode (latitude, longitude) of a particular address.
Defaults output as an object, can specify a switch to output as a string

## EXAMPLES

### EXAMPLE 1
```
Get-GeoCode -Address '1600 Pennsylvania Ave NW, Washington DC'
```

Latitude Longitude
-------- ---------
38.89767 -77.03655

### EXAMPLE 2
```
Get-GeoCode -Address '1600 Pennsylvania Ave NW, Washington DC' -AsString
```

38.89767,-77.03655

### EXAMPLE 3
```
Get-GeoCode -Address '10 Downing St, London UK'
```

Latitude Longitude
-------- ---------
51.51288 0.06600

## PARAMETERS

### -Address
Mandatory string which is the address to lookup

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AsString
Switch to make the output appear as a string

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
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

Inspired by: https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/geocoding-converting-addresses-to-lat-long-part-2?CommentId=767cd85b-6f1b-475a-a419-d894f487ca87

## RELATED LINKS
