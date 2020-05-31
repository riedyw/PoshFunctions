---
external help file: MyFunctions-help.xml
Module Name: MyFunctions
online version:
schema: 2.0.0
---

# ConvertFrom-UnixEpoch

## SYNOPSIS
Converts a Unix Epoch value to a datetime

## SYNTAX

```
ConvertFrom-UnixEpoch [-UnixEpoch] <Int64> [<CommonParameters>]
```

## DESCRIPTION
Converts a Unix Epoch value to a datetime

## EXAMPLES

### EXAMPLE 1
```
ConvertFrom-UnixEpoch -UnixEpoch 1521115200
```

Assuming that your local time zone is EST, and your region/culture is EN-US this would return the datetime

Thursday, March 15, 2018 12:00:00 PM

### EXAMPLE 2
```
ConvertFrom-UnixEpoch 1517502479
```

Assuming that your local time zone is EST, and your region/culture is EN-US this would return the datetime

Thursday, February 01, 2018 4:27:59 PM

### EXAMPLE 3
```
"3/15/2018 12:00:00 PM" | ConvertFrom-UTC
```

Assuming that your local time zone is EST, and your region/culture is EN-US this would return the datetime

Thursday, March 15, 2018 8:00:00 AM

### EXAMPLE 4
```
ConvertFrom-UnixEpoch 1517502479 -Verbose
```

Assuming that your local time zone is EST, and your region/culture is EN-US this would return the following output:

VERBOSE: You entered a Unix Epoch of:  '1517502479'
VERBOSE: The beginning of a Unix Epoch is: '01/01/1970 00:00:00'
VERBOSE: The date '02/01/2018 16:27:59' is 1517502479 seconds in the future of '01/01/1970 00:00:00'
Thursday, February 01, 2018 4:27:59 PM

## PARAMETERS

### -UnixEpoch
{{Fill UnixEpoch Description}}

```yaml
Type: Int64
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: 0
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
