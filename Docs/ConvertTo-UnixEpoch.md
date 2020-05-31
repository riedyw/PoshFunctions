---
external help file: MyFunctions-help.xml
Module Name: MyFunctions
online version:
schema: 2.0.0
---

# ConvertTo-UnixEpoch

## SYNOPSIS
Converts a datetime to a UnixEpoch which is the number of seconds since '1/1/1970 12:00:00 AM'

## SYNTAX

```
ConvertTo-UnixEpoch [-DateTime] <DateTime> [<CommonParameters>]
```

## DESCRIPTION
Converts a datetime to a UnixEpoch which is the number of seconds since '1/1/1970 12:00:00 AM'

## EXAMPLES

### EXAMPLE 1
```
ConvertTo-UnixEpoch -DateTime "1/25/2018 8:34:31 AM"
```

Would return the value

1516869271

### EXAMPLE 2
```
ConvertTo-UnixEpoch '2/1/2018 4:27:59 PM'
```

Would return the value

1517502479

### EXAMPLE 3
```
"3/15/2018 12:00:00.545 PM" | ConvertTo-UnixEpoch
```

Would return the value

1521115200.545

### EXAMPLE 4
```
ConvertTo-UnixEpoch '2/1/2018 4:27:59 PM' -Verbose
```

Would return the following output

VERBOSE: You entered a Local Time of:  '02/01/2018 16:27:59'
VERBOSE: The beginning of a Unix Epoch is: '01/01/1970 00:00:00'
VERBOSE: The date '02/01/2018 16:27:59' is 1517502479 seconds in the future of '01/01/1970 00:00:00'
1517502479

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

### System.Double

## NOTES

## RELATED LINKS
