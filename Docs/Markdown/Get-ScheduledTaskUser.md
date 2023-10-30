---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-ScheduledTaskUser

## SYNOPSIS

Get a list of scheduled tasks and the user context that they run under. By default excluded system tasks

## SYNTAX

### __AllParameterSets

```
Get-ScheduledTaskUser [[-ComputerName <String[]>]] [[-UserName <String>]] [-IncludeInteractive] [-IncludeSystem] [<CommonParameters>]
```

## DESCRIPTION

Get a list of scheduled tasks and the user context that they run under.
By default excluded system tasks


## EXAMPLES


## PARAMETERS

### -ComputerName

An array of computer names.
Defaults to $env:COMPUTERNAME.
Aliased to 'CN', 'Server'

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: CN,Server
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: $env:COMPUTERNAME
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -IncludeInteractive

Switch to include interactive only tasks.
Aliased to 'II'

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: II
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -IncludeSystem

Switch to include the system scheduled tasks.
Aliased to 'IS'

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: IS
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -UserName

A -like search string to compare process username context.
Defaults to '*'

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 1
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

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

Fill Related Links Here

