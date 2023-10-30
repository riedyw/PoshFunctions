---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# ConvertTo-UTC

## SYNOPSIS

Converts a datetime from local time to UTC

## SYNTAX

### __AllParameterSets

```
ConvertTo-UTC [-Date] <DateTime[]> [-IncludeOriginal] [<CommonParameters>]
```

## DESCRIPTION

Converts a datetime from local time to UTC.
Can optionally include the original datetime entered.


## EXAMPLES

### Example 1: EXAMPLE 1

```
ConvertTo-UTC -Date '1/25/2018 8:34:31 AM'
```

Assuming that your local time zone is EST, and your region/culture is EN-US this would return the string

Thursday, January 25, 2018 1:34:31 PM





### Example 2: EXAMPLE 2

```
ConvertTo-UTC '2/1/2018 4:27:59 PM'
```

Assuming that your local time zone is EST, and your region/culture is EN-US this would return the string

Thursday, February 01, 2018 9:27:59 PM





### Example 3: EXAMPLE 3

```
"3/15/2018 12:00:00 PM" | ConvertTo-UTC
```

Assuming that your local time zone is EST, and your region/culture is EN-US this would return the string

Thursday, March 15, 2018 4:00:00 PM





### Example 4: EXAMPLE 4

```
"3/15/2018 12:00:00 PM" | ConvertTo-UTC -IncludeOriginal
```

Assuming that your local time zone is EST, and your region/culture is EN-US this would return the string

Original              UTC
--------              ---
3/15/2018 12:00:00 PM 3/15/2018 4:00:00 PM






## PARAMETERS

### -Date

The datetime that you wish to be converted to UTC.
Can be a single datetime or an array.
Can be passed from the pipeline.
This parameter has an alias of 'DateTime'.

```yaml
Type: DateTime[]
Parameter Sets: (All)
Aliases: DateTime
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -IncludeOriginal

A switch which controls if you wish to see the original inputted date in the output.

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



## RELATED LINKS

Fill Related Links Here

