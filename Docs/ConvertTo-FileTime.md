---
external help file: MyFunctions-help.xml
Module Name: MyFunctions
online version:
schema: 2.0.0
---

# ConvertTo-FileTime

## SYNOPSIS
Converts a \[datetime\] or datetime \[string\] into a large integer filetime.

## SYNTAX

```
ConvertTo-FileTime [-DateTime] <DateTime> [<CommonParameters>]
```

## DESCRIPTION
Converts a \[datetime\] or datetime \[string\] into a large integer filetime.

Filetimes are expressed in Ticks.
Ticks can range from 0 - 2650467743999999999.
Translating these into dates you get
                  0 = Monday, January 01, 1601 12:00:00.00000 AM
2650467743999999999 = Friday, December 31, 9999 11:59:59.99999 PM

## EXAMPLES

### EXAMPLE 1
```
ConvertTo-FileTime -DateTime "1/25/2018 8:34:31 AM"
```

Would return the \[int64\]
131613608710000000

### EXAMPLE 2
```
ConvertTo-FileTime '2/1/2018 4:27:59 PM'
```

Would return the \[int64\]
131619940790000000

### EXAMPLE 3
```
"3/15/2018 12:00:00 PM" | ConvertTo-FileTime
```

Would return the \[int64\]
131656032000000000

### EXAMPLE 4
```
ConvertTo-FileTime '2/1/2018 4:27:59 PM' -Verbose
```

Would return the following:
VERBOSE: The max # of ticks is '2650467743999999999' and the special NEVER flag is '9223372036854775807'
VERBOSE: You entered a datetime of: '02/01/2018 16:27:59'
131619940790000000

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

### [int64]

## NOTES
An \[int64\] filetime property is used in Active Directory.
For instance against UserAccount it is in fields, badPasswordTime, LastLogon, accountExpires, LastLogonTimeStamp.
There are other objects and fields in AD that use this filetime property, poke around and find them.
Use this function to convert them into normal DateTime objects.

## RELATED LINKS
