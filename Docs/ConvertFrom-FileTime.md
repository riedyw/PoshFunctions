---
external help file: MyFunctions-help.xml
Module Name: MyFunctions
online version:
schema: 2.0.0
---

# ConvertFrom-FileTime

## SYNOPSIS
Converts a large integer filetime into a \[datetime\] if the value is valid or a \[string\] if invalid.

## SYNTAX

```
ConvertFrom-FileTime [-FileTime] <Int64> [<CommonParameters>]
```

## DESCRIPTION
Converts a large integer filetime \[int64\] into a datetime string.
There is a special value that returns a value of "Never".
Returns a \[datetime\] in Universal Time (UTC)

Filetimes are expressed in Ticks.
Ticks can range from 0 - 2650467743999999999.
Translating these into dates you get
                  0 = Monday, January 01, 1601 12:00:00.00000 AM
2650467743999999999 = Friday, December 31, 9999 11:59:59.99999 PM

## EXAMPLES

### EXAMPLE 1
```
ConvertFrom-FileTime -FileTime 131613608711918252
```

Would return the \[datetime\]
Thursday, January 25, 2018 1:34:31 PM

### EXAMPLE 2
```
ConvertFrom-FileTime 131619940792563529
```

Would return the \[datetime\]
Thursday, February 01, 2018 9:27:59 PM

### EXAMPLE 3
```
ConvertFrom-FileTime 9223372036854775807
```

Would return the \[string\]
Never

### EXAMPLE 4
```
ConvertFrom-FileTime 9223372036854775806
```

Would return the \[string\]
Invalid

### EXAMPLE 5
```
ConvertFrom-FileTime 0
```

Would return the \[datetime\]
Monday, January 01, 1601 12:00:00 AM

### EXAMPLE 6
```
# Assuming that the value of the LastLogon property for a particular user in Active Directory is 131702624106036606
```

$LastLogon = 131702624106036606
ConvertFrom-FileTime $LastLogon

Would return the \[datetime\]
Tuesday, May 08, 2018 2:13:30 PM

## PARAMETERS

### -FileTime
\[int64\] filetime property, used in AD in fields, badPasswordTime, LastLogon, accountExpires, LastLogonTimeStamp

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

### [datetime] if the FileTime specified is in valid range 0 - 2650467743999999999

[string]   if the FileTime greater than the max value above
  Invalid  if FileTime > $MaxTicks and < $Never
  Never    if FileTime = $Never

## NOTES

## RELATED LINKS
