---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version: https://gallery.technet.microsoft.com/scriptcenter/Get-MachineType-VM-or-ff43f3a9
schema: 2.0.0
---

# Get-NtpDate

## SYNOPSIS
To get the time from an NTP server

## SYNTAX

```
Get-NtpDate [-ComputerName] <String> [-Port <Int32>] [<CommonParameters>]
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

## PARAMETERS

### -ComputerName
The name or IPv4 address of the computer running NTP.
Aliased to 'CN', 'Server', 'NtpServer'

```yaml
Type: String
Parameter Sets: (All)
Aliases: CN, Server, NtpServer

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Port
The port number NTP is listening to.
Defaults to 123

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 123
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### [datetime]
## NOTES

## RELATED LINKS
