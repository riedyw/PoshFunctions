---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-RandomDate

## SYNOPSIS

Gets a random date

## SYNTAX

### __AllParameterSets

```
Get-RandomDate [[-MinDate <DateTime>]] [[-MaxDate <DateTime>]] [-DateLimit <String>] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

Gets a random date.
Can specify minimum and maximum dates.
Can optionally specify -DateLimit to
stay within the time limits of the possible datatypes.
Can also use formatting switches -Format
or -UFormat which function the same as Get-Date parameters of the same name.


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-Randomdate  -MinDate 1/1/1969 -MaxDate 1/1/2040 -DateLimit UnixEpoch -verbose
```

Would return something similar to the following:
VERBOSE: $MinDate specified as [01/01/1969 00:00:00]
VERBOSE: $MaxDate specified as [01/01/2040 00:00:00]
VERBOSE: $MinDate outside valid UnixEpoch setting to [01/01/1970 00:00:00]
VERBOSE: $MaxDate outside valid UnixEpoch setting to [01/19/2038 03:14:07]
VERBOSE: The random date calculated is [12/26/1997 18:41:51]
VERBOSE: The return value is [System.DateTime] datatype
Friday, December 26, 1997 6:41:51 PM





### Example 2: EXAMPLE 2

```
Get-RandomDate -DateLimit UnixEpoch
```

Would return something similar to the following:
Friday, August 12, 2005 2:57:51 AM





### Example 3: EXAMPLE 3

```
Get-RandomDate  -MinDate 1/1/1576 -MaxDate 7/4/1776 -DateLimit FileTime -Verbose
```

Would return something similar to the following:
VERBOSE: $MinDate specified as [01/01/1576 00:00:00]
VERBOSE: $MaxDate specified as [07/04/1776 00:00:00]
VERBOSE: $MinDate outside valid FileTime setting to [01/01/1601 00:00:00]
VERBOSE: The random date calculated is [06/27/1615 16:45:27]
VERBOSE: The return value is [System.DateTime] datatype
Saturday, June 27, 1615 4:45:27 PM





### Example 4: EXAMPLE 4

```
Get-RandomDate  -MinDate 1/1/19 -MaxDate 2/1/19
```

Would return something similar to the following:
Wednesday, January 30, 2019 1:25:06 AM





### Example 5: EXAMPLE 5

```
# Desire to get random date between a year in the past, and a year in the future
```

Get-RandomDate  -MinDate (Get-Date).AddMonths(-12) -MaxDate (Get-Date).AddMonths(12)

Saturday, March 27, 2021 3:22:55 AM





### Example 6: EXAMPLE 6

```
Get-RandomDate -DateLimit UnixEpoch -IncludeInput
```

DateLimit MinDate              MaxDate              RandomDate
--------- -------              -------              ----------
UnixEpoch 1/1/1970 12:00:00 AM 1/19/2038 3:14:07 AM 9/19/2003 1:50:32 PM






## PARAMETERS

### -DateLimit

A [string] validated against the set @('DateTime','UnixEpoch','FileTime').
Defaults to 'DateTime'
DateLimit       MinDate                 MaxDate
===========     =====================   =====================
DateTime        01/01/0001 12:00:00AM   12/31/9999 11:59:59PM
UnixEpoch       01/01/1970 12:00:00AM   01/19/2038 03:14:07AM
FileTime        01/01/1601 12:00:00AM   12/31/9999 11:59:59PM

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: DateTime
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -IncludeInput

{{ Fill IncludeInput Description }}

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

### -MaxDate

An optional [datetime] indicating the highest date to return

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 1
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -MinDate

An optional [datetime] indicating the lowest date to return

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### [datetime]



## NOTES

If you specify -MinDate or -MaxDate, -MinDate must be less than or equal to -MaxDate.


## RELATED LINKS

[Get-Date] ()

