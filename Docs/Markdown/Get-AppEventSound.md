---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-AppEventSound

## SYNOPSIS

Determines the sounds that are configured to play after certain events are triggered

## SYNTAX

### __AllParameterSets

```
Get-AppEventSound [[-Name <String>]] [<CommonParameters>]
```

## DESCRIPTION

Determines the sounds that are configured to play after certain events are triggered


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-AppEventSound -Name "Notification.Looping.Alarm" -Verbose
```

VERBOSE: Starting [Get-AppEventsSound]
VERBOSE: Searching for AppEvents matching [Notification.Looping.Alarm]

VERBOSE: Ending [Get-AppEventsSound]
AppEvent                   UnExpanded                     Expanded
--------                   ----------                     --------
Notification.Looping.Alarm %SystemRoot%\media\Alarm01.wav C:\WINDOWS\media\Alarm01.wav






## PARAMETERS

### -Name

A string that will perform -like search of keys found in the Registry

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES



## RELATED LINKS

Fill Related Links Here

