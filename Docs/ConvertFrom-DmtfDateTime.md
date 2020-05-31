---
external help file: MyFunctions-help.xml
Module Name: MyFunctions
online version:
schema: 2.0.0
---

# ConvertFrom-DmtfDateTime

## SYNOPSIS
Converts a DMTF datetime into a normal datetime value.

## SYNTAX

```
ConvertFrom-DmtfDateTime [-DmtfDateTime] <String> [<CommonParameters>]
```

## DESCRIPTION
Converts a DMTF datetime into a normal datetime value.

DmtfDateTime is of the form "YYYYMMDDHHmmss.ffffff+###"

Where
    YYYY    is the 4 digit year
    MM      is the 2 digit month
    DD      is the 2 digit day of the month
    HH      is the 2 digit in 24 hour format (00-23, 1 pm = 13)
    mm      is the 2 digit minute (00-59)
    ss      is the 2 digit second (00-59)
    ffffff  is the 6 digit fractional second
    +       is the plus or minus (+-) offset from UTC
    ###     is the 3 digit number of minutes offset from UTC (000-720)

## EXAMPLES

### EXAMPLE 1
```
ConvertFrom-DmtfDateTime "20161124225058.082190+060"
```

Would return the datetime

Thursday, November 24, 2016 4:50:58 PM

### EXAMPLE 2
```
ConvertFrom-DmtfDateTime "20180205154504.962817-300"
```

Would return the datetime

Monday, February 05, 2018 3:45:04 PM

### EXAMPLE 3
```
ConvertFrom-DmtfDateTime "20180205154504" -verbose
```

Would return the following

VERBOSE: The DMTF date time should be 25 characters long
False

### EXAMPLE 4
```
ConvertFrom-DmtfDateTime "2018020515450A.962817-300" -verbose
```

Would return the following (note A in the final position of seconds)

VERBOSE: The DMTF date time should be of the form 'YYYYMMDDHHmmss.ffffff+###'
False

### EXAMPLE 5
```
"20180205154503.962817-300" | ConvertFrom-DmtfDateTime
```

Would return the datetime

Monday, February 05, 2018 3:45:03 PM

## PARAMETERS

### -DmtfDateTime
{{Fill DmtfDateTime Description}}

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

### System.String

## NOTES

## RELATED LINKS
