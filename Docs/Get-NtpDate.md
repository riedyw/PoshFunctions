---
external help file: MyFunctions-help.xml
Module Name: MyFunctions
online version:
schema: 2.0.0
---

# Get-NtpDate

## SYNOPSIS
To get the time from an NTP server

## SYNTAX

```
Get-NtpDate [-ComputerName] <String> [<CommonParameters>]
```

## DESCRIPTION
To get the time from an NTP server.

Will return a \[DateTime\] and accepts the -Verbose parameter.
If request fails it will return "1/1/1900"

## EXAMPLES

### EXAMPLE 1
```
Get-NtpDate $DC
```

Assuming $DC holds the name of the domain controller then would return a datetime similar to
Monday, March 05, 2018 9:52:57 AM

### EXAMPLE 2
```
Test-NtpDateVsNow "DoesNotExist"
```

Assuming "DoesNotExist" doesn't actually exist as a computer name then would return the datetime
Monday, January 01, 1900 12:00:00 AM

## PARAMETERS

### -ComputerName
The name or IPv4 address of the computer running NTP

```yaml
Type: String
Parameter Sets: (All)
Aliases: NtpServer

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

### A datetime object

## NOTES
Author:     Bill Riedy
Version:    1.0
Date:       2018/03/13
Notes:      None at this time

## RELATED LINKS
