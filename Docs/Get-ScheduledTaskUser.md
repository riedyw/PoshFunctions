---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version: https://social.msdn.microsoft.com/Forums/vstudio/en-US/0221d962-26e6-4a7e-be7a-72cd669a0dfc/why-systemmathround0251-2?forum=vbgeneral

Talks about Visual Basic but the same info applies to Powershell.
schema: 2.0.0
---

# Get-ScheduledTaskUser

## SYNOPSIS
Get a list of scheduled tasks and the user context that they run under.
By default excluded system tasks

## SYNTAX

```
Get-ScheduledTaskUser [[-ComputerName] <String[]>] [[-UserName] <String>] [-IncludeSystem]
 [-IncludeInteractive] [<CommonParameters>]
```

## DESCRIPTION
Get a list of scheduled tasks and the user context that they run under.
By default excluded system tasks

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -ComputerName
An array of computer names.
Defaults to $env:COMPUTERNAME.
Aliased to 'CN', 'Server'

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: CN, Server

Required: False
Position: 1
Default value: $env:COMPUTERNAME
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserName
A -like search string to compare process username context.
Defaults to '*'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeSystem
Switch to include the system scheduled tasks.
Aliased to 'IS'

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: IS

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeInteractive
Switch to include interactive only tasks.
Aliased to 'II'

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: II

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### psobject
## NOTES
Unless the -IncludeSystem switch is specified the following will be excluded from the output:
    'Administrator',
    'Administrators',
    'Authenticated Users',
    'Everyone',
    'INTERACTIVE',
    'LOCAL SERVICE',
    'NETWORK SERVICE',
    'Run As User',
    'SYSTEM',
    'Users'

## RELATED LINKS
