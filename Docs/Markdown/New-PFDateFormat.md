---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# New-PFDateFormat

## SYNOPSIS
Returns a \[psobject\] with a \[datetime\] in multiple other formats

## SYNTAX

```
New-PFDateFormat [[-Date] <DateTime>] [<CommonParameters>]
```

## DESCRIPTION
Returns a \[psobject\] with a \[datetime\] in multiple other formats

## EXAMPLES

### EXAMPLE 1
```
New-PFDateFormat -Date '9/11/2001 08:15'
```

Date        : 9/11/2001 8:15:00 AM
DMTF        : 20010911081500.000000-240
Unix        : 1000196100
FileTime    : 126446877000000000
ICSDateTime : 20010911T081500
Excel       : 37143.34375

### EXAMPLE 2
```
New-PFDateFormat
```

Date        : 12/16/2021 10:39:32 AM
DMTF        : 20211216103932.967575-300
Unix        : 1639651172.96758
FileTime    : 132841427729675751
ICSDateTime : 20211216T103932
Excel       : 44544.4441315692

### EXAMPLE 3
```
New-PFDateFormat -Verbose
```

VERBOSE: Starting \[New-PFDateFormat\]

Date        : 12/16/2021 10:46:13 AM
DMTF        : 20211216104613.910469-300
Unix        : 1639651573.91047
FileTime    : 132841431739104697
ICSDateTime : 20211216T104613
Excel       : 44544.4487721119

VERBOSE: Ending \[New-PFDateFormat\]

## PARAMETERS

### -Date
Optional \[datetime\] parameter for the date you want converted into other formats.
If omitted it will call the class::New method with no parameter
which will determine the current \[datetime\] and format it several different ways

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Relies on PFDateFormat class defined in .\PoshFunctions.psm1

DMTF is of the form 'yyyymmddHHMMSS.ffffff+UUU'
Unix is Unix epoch format which is the number of seconds since '1/1/1970 12:00:00 AM UTC'
FileTime is an \[int64\] which represents a \[datetime\] expressed in Ticks.
A Tick represents 1/100,000 of a second.
Ticks can range from 0 - 2650467743999999999.
Translating these into dates you get
                      0 = Monday, January 01, 1601 12:00:00.00000 AM
    2650467743999999999 = Friday, December 31, 9999 11:59:59.99999 PM
ICSDateTime is a \[datetime\] formatted is of the form 'yyyymmddTHHMMSSZ'
Excel is a \[double\] that represents dates as the number of days since (Get-Date 1/1/1900)

## RELATED LINKS
