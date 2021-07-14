---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# ConvertFrom-UTC

## SYNOPSIS
Converts a datetime from UTC to local time

## SYNTAX

```
ConvertFrom-UTC [-Date] <DateTime[]> [-IncludeInput] [<CommonParameters>]
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
ConvertFrom-UTC '2/1/2018 9:27:59 PM' -verbose
```

Would return
VERBOSE: Starting ConvertFrom-UTC
VERBOSE: You entered a UTC Time of:  '2/1/2018 9:27:59 PM'
VERBOSE: Your local timezone is '(UTC-05:00) Eastern Time (US & Canada)'
VERBOSE: Your local time is: '02/01/2018 16:27:59'

Thursday, February 1, 2018 4:27:59 PM
VERBOSE: Ending ConvertFrom-UTC

### EXAMPLE 4
```
"3/15/2018 12:00:00 PM" | ConvertFrom-UTC
```

Assuming that your local time zone is EST, and your region/culture is EN-US this would return the datetime

Thursday, March 15, 2018 8:00:00 AM

### EXAMPLE 5
```
ConvertFrom-UTC -date '2/1/2018 9:27:59 PM' -IncludeInput
```

Would return the following if your local time zone is EST, and your region/culture is EN-US
UTC                 LocalTime
---                 ---------
2/1/2018 9:27:59 PM 2/1/2018 4:27:59 PM

## PARAMETERS

### -Date
The date you wish to convert to UTC

```yaml
Type: DateTime[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -IncludeInput
Switch to enable displaying input parameters in the output

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

### datetime
## NOTES
# inspired by: https://blogs.technet.microsoft.com/heyscriptingguy/2017/02/01/powertip-convert-from-utc-to-my-local-time-zone/

## RELATED LINKS

[[System.TimeZoneInfo]]()

