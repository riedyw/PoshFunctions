---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# New-PFDateFormat

## SYNOPSIS

Returns a [psobject] with a [datetime] in multiple other formats

## SYNTAX

### __AllParameterSets

```
New-PFDateFormat [[-Date <DateTime>]] [<CommonParameters>]
```

## DESCRIPTION

Returns a [psobject] with a [datetime] in multiple other formats


## EXAMPLES

### Example 1: EXAMPLE 1

```
New-PFDateFormat -Date '9/11/2001 08:15'
```

Date        : 9/11/2001 8:15:00 AM
DMTF        : 20010911081500.000000-240
Unix        : 1000196100
FileTime    : 126446877000000000
ICSDateTime : 20010911T081500
ISO8601     : 2001.09.11T08:15:00
Excel       : 37143.34375





### Example 2: EXAMPLE 2

```
New-PFDateFormat
```

Date        : 2/9/2022 3:14:37 PM
DMTF        : 20220209151437.616838-300
Unix        : 1644419677.61684
FileTime    : 132889112776168387
ICSDateTime : 20220209T151437
ISO8601     : 2022.02.09T15:14:37
Excel       : 44599.6351576023





### Example 3: EXAMPLE 3

```
New-PFDateFormat -Verbose
```

VERBOSE: Starting [New-PFDateFormat]

Date        : 2/9/2022 3:15:37 PM
DMTF        : 20220209151537.066346-300
Unix        : 1644419737.06635
FileTime    : 132889113370663466
ICSDateTime : 20220209T151537
ISO8601     : 2022.02.09T15:15:37
Excel       : 44599.6358456753

VERBOSE: Ending [New-PFDateFormat]






## PARAMETERS

### -Date

Optional [datetime] parameter for the date you want converted into other formats.
If omitted it will call the class::New method with no parameter
which will determine the current [datetime] and format it several different ways

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

## NOTES

Relies on PFDateFormat class defined in .\PoshFunctions.psm1

DMTF is of the form 'yyyymmddHHMMSS.ffffff+UUU'
Unix is Unix epoch format which is the number of seconds since '1/1/1970 12:00:00 AM UTC'
FileTime is an [int64] which represents a [datetime] expressed in Ticks.
A Tick represents 1/100,000 of a second.
Ticks can range from 0 - 2650467743999999999.
Translating these into dates you get
                      0 = Monday, January 01, 1601 12:00:00.00000 AM
    2650467743999999999 = Friday, December 31, 9999 11:59:59.99999 PM
ICSDateTime is a [datetime] formatted is of the form 'yyyyMMddTHHmmss'
ISO8601 is a [datetime] formatted is of the form 'yyyy.MMddTHH:mm:ss'
Excel is a [double] that represents dates as the number of days since (Get-Date 1/1/1900)


## RELATED LINKS

Fill Related Links Here

