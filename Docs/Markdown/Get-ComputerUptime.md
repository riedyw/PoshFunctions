---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version: http://wonkysoftware.appspot.com
schema: 2.0.0
---

# Get-ComputerUptime

## SYNOPSIS
To mimic and extend the Get-ComputerUptime function found in PowerShell 6 or 7

## SYNTAX

```
Get-ComputerUptime [-Since] [[-Name] <String[]>] [-IncludeComputerName] [[-Credential] <PSCredential>]
 [<CommonParameters>]
```

## DESCRIPTION
To mimic and extend the Get-ComputerUptime function found in PowerShell 6 or 7.
Function aliased to 'Get-LastReboot' for backward compatibility

## EXAMPLES

### EXAMPLE 1
```
Get-ComputerUptime
```

Days              : 0
Hours             : 8
Minutes           : 20
Seconds           : 37
Milliseconds      : 306
Ticks             : 300373061593
TotalDays         : 0.34765400647338
TotalHours        : 8.34369615536111
TotalMinutes      : 500.621769321667
TotalSeconds      : 30037.3061593
TotalMilliseconds : 30037306.1593

### EXAMPLE 2
```
Get-ComputerUptime -Since
```

Sunday, February 28, 2021 12:47:04 PM

### EXAMPLE 3
```
Get-ComputerUptime -IncludeComputerName -Since
```

ComputerName LastBoot
------------ --------
DemoLaptop   3/16/2021 12:59:24 PM

### EXAMPLE 4
```
Get-ComputerUptime -IncludeComputerName -Since -ComputerName server1, server2
```

ComputerName LastBoot
------------ --------
server1      3/18/2021 10:58:53 PM
server2      3/17/2021 1:50:49 PM

## PARAMETERS

### -Since
Switch to show last boot time, not the timespan since last boot

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
{{ Fill Name Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: ComputerName, CN, Server

Required: False
Position: 1
Default value: $env:COMPUTERNAME
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -IncludeComputerName
Switch on whether to include the computer name in the output

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Credential
{{ Fill Credential Description }}

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### psobject
## NOTES
To mimic and extend the functionality of the Get-Uptime function found in PowerShell 6 or 7

Put in error checking around Get-CimInstance to handle Kerberos errors.

## RELATED LINKS
