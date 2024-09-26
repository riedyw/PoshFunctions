---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-LastDayInMonth

## SYNOPSIS

Get the last day of the month given the year as an integer, and the month as an integer

## SYNTAX

### Date (Default)

```
Get-LastDayInMonth [-Date <DateTime>] [-IncludeInput] [<CommonParameters>]
```

### YearMonth

```
Get-LastDayInMonth -Month <Int32> -Year <Int32> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

Get the last day of the month given the year as an integer, and the month as an integer


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-LastDayInMonth -Year 2020 -Month 2
```

29





### Example 2: EXAMPLE 2

```
Get-LastDayInMonth -Year 2019 -Month 2
```

28





### Example 3: EXAMPLE 3

```
Get-LastDayInMonth -Year 2019 -Month 2 -IncludeInput
```

Year Month Days
---- ----- ----
2019     2   28





### Example 4: EXAMPLE 4

```
new-object psobject -property @{Year=2000;Month=2} | Get-LastDayInMonth
```

29





### Example 5: EXAMPLE 5

```
Get-Date 'Feb 1, 2019' | Get-LastDayInMonth -IncludeInput
```

Year Month Days
---- ----- ----
2019     2   28





### Example 6: EXAMPLE 6

```
Get-LastDayInMonth -IncludeInput -Verbose
```

Assuming the current day was in September 2021 the result would be:
VERBOSE: Starting [Get-LastDayInMonth]
VERBOSE: ParameterSetName [Date]

VERBOSE: Ending [Get-LastDayInMonth]
Year Month Days
---- ----- ----
2021     9   30






## PARAMETERS

### -Date

Datetime value, accept value from pipeline by propertyname, default parameter set name 'Date'

```yaml
Type: DateTime
Parameter Sets: Date
Aliases: 
Accepted values: 

Required: True (None) False (Date)
Position: Named
Default value: (Get-Date)
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -IncludeInput

Switch to include the input in the output

```yaml
Type: SwitchParameter
Parameter Sets: YearMonth, Date
Aliases: 
Accepted values: 

Required: True (None) False (YearMonth, Date)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Month

Integer in the range 1-12, mandatory, accept value from pipeline by propertyname, parameter set name 'YearMonth'

```yaml
Type: Int32
Parameter Sets: YearMonth
Aliases: 
Accepted values: 

Required: True (YearMonth) False (None)
Position: Named
Default value: 0
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -Year

Integer in the range 1-9999, mandatory, accept value from pipeline by propertyname, parameter set name 'YearMonth'

```yaml
Type: Int32
Parameter Sets: YearMonth
Aliases: 
Accepted values: 

Required: True (YearMonth) False (None)
Position: Named
Default value: 0
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### int



## NOTES

Inspired by: https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/calculating-first-and-last-day-of-month

- added $Date parameter and parameter set names to function


## RELATED LINKS

Fill Related Links Here

