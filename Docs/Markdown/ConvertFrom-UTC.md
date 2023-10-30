---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# ConvertFrom-UTC

## SYNOPSIS

Converts a datetime from UTC to local time

## SYNTAX

### __AllParameterSets

```
ConvertFrom-UTC [-Date] <DateTime[]> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

Converts a datetime from Universal Coordinated Time to local time


## EXAMPLES

### Example 1: EXAMPLE 1

```
ConvertFrom-UTC -Date "1/25/2018 1:34:31 PM"
```

Assuming that your local time zone is EST, and your region/culture is EN-US this would return the datetime

Thursday, January 25, 2018 8:34:31 AM





### Example 2: EXAMPLE 2

```
ConvertFrom-UTC -Date "1/25/2018 1:34:31 PM" -IncludeInput
```

Assuming that your local time zone is EST, and your region/culture is EN-US this would return the datetime

UTC                  LocalTime
---                  ---------
1/25/2018 1:34:31 PM 1/25/2018 8:34:31 AM





### Example 3: EXAMPLE 3

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





### Example 4: EXAMPLE 4

```
"3/15/2018 12:00:00 PM" | ConvertFrom-UTC
```

Assuming that your local time zone is EST, and your region/culture is EN-US this would return the datetime

Thursday, March 15, 2018 8:00:00 AM





### Example 5: EXAMPLE 5

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
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -IncludeInput

Switch to enable displaying input parameters in the output

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### datetime



## NOTES

# inspired by: https://blogs.technet.microsoft.com/heyscriptingguy/2017/02/01/powertip-convert-from-utc-to-my-local-time-zone/


## RELATED LINKS

[[System.TimeZoneInfo]] ()

