---
external help file: MyFunctions-help.xml
Module Name: MyFunctions
online version:
schema: 2.0.0
---

# ConvertTo-DmtfDateTime

## SYNOPSIS
Converts a datetime into a DTMF formatted datetime string

## SYNTAX

```
ConvertTo-DmtfDateTime [-DateTime] <DateTime> [<CommonParameters>]
```

## DESCRIPTION
Converts a datetime into a DTMF formatted datetime string

DmtfDateTime is of the form "YYYYMMDDHHmmss.ffffff+###"

Where
    YYYY    is the 4 digit year
    MM      is the 2 digit month
    DD      is the 2 digit day of the month
    HH      is the 2 digit in 24 hour format (00-23, 1 pm = 13)
    mm      is the 2 digit minute (00-59)
    ss      is the 2 digit second (00-59)
    ffffff  is the 6 digit fractional second
    +       is the plus or minus offset from UTC
    ###     is the 3 digit number of minutes offset from UTC (000-720)

## EXAMPLES

### EXAMPLE 1
```
ConvertTo-DmtfDateTime -DateTime "1/25/2018 8:34:31 AM"
```

Assuming a timezone of "Eastern Time" and a culture of "en-US" this would return the string

20180125083431.000000-300

### EXAMPLE 2
```
ConvertTo-DmtfDateTime '2/1/2018 4:27:59 PM'
```

Assuming a timezone of "Eastern Time" and a culture of "en-US" this would return the string

20180201162759.000000-300

### EXAMPLE 3
```
"3/15/2018 12:00:00 PM" | ConvertTo-DmtfDateTime
```

Assuming a timezone of "Eastern Time" and a culture of "en-US" this would return the string and an offset of -240 as this would be Daylight Savings Time.

20180315120000.000000-240

### EXAMPLE 4
```
ConvertTo-DmtfDateTime '2/1/2018 4:27:59 PM' -Verbose
```

Assuming a timezone of "Eastern Time" and a culture of "en-US" this would return the string

VERBOSE: You entered a datetime of: '02/01/2018 16:27:59'
20180201162759.000000-300

## PARAMETERS

### -DateTime
{{Fill DateTime Description}}

```yaml
Type: DateTime
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

### System.String

## NOTES

## RELATED LINKS
