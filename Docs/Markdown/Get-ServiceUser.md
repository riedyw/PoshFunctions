---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-ServiceUser

## SYNOPSIS

Get a list of services and the user context that they run under. By default excluded services running as system

## SYNTAX

### __AllParameterSets

```
Get-ServiceUser [-Name] <String[]> [[-UserName <String>]] [-IncludeSystem] [<CommonParameters>]
```

## DESCRIPTION

Get a list of services and the user context that they run under.
By default excluded services running as system


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-ServiceUser
```








## PARAMETERS

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

### -Name

Please enter the name of a computer

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: ComputerName,CN,Server
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: True
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
    'LocalSystem',
    'NT AUTHORITY\LocalService',
    'NT AUTHORITY\NetworkService',
    'NT AUTHORITY\Network Service',
    'NT AUTHORITY\SYSTEM'


## RELATED LINKS

Fill Related Links Here

