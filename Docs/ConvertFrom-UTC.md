---
external help file: MyFunctions-help.xml
Module Name: MyFunctions
online version:
schema: 2.0.0
---

# ConvertFrom-UTC

## SYNOPSIS
Converts a datetime from UTC to local time

## SYNTAX

```
ConvertFrom-UTC [-UTCTime] <String> [<CommonParameters>]
```

## DESCRIPTION
Converts a datetime from Universal Coordinated Time to local time

## EXAMPLES

### EXAMPLE 1
```
ConvertFrom-UTC -DateTime "1/25/2018 1:34:31 PM"
```

Assuming that your local time zone is EST, and your region/culture is EN-US this would return the datetime

Thursday, January 25, 2018 8:34:31 AM

### EXAMPLE 2
```
ConvertFrom-UTC '2/1/2018 9:27:59 PM'
```

Assuming that your local time zone is EST, and your region/culture is EN-US this would return the datetime

Thursday, February 01, 2018 4:27:59 PM

### EXAMPLE 3
```
"3/15/2018 12:00:00 PM" | ConvertFrom-UTC
```

Assuming that your local time zone is EST, and your region/culture is EN-US this would return the datetime

Thursday, March 15, 2018 8:00:00 AM

## PARAMETERS

### -UTCTime
{{Fill UTCTime Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.DateTime

## NOTES

## RELATED LINKS

[[System.TimeZoneInfo]]()

