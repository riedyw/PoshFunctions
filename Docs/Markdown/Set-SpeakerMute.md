---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Set-SpeakerMute

## SYNOPSIS

Sets the state of the speaker being mute. If you pass $true to function it will turn on Mute.

## SYNTAX

### On (Default)

```
Set-SpeakerMute [-Confirm] [-On] [-WhatIf] [<CommonParameters>]
```

### Off

```
Set-SpeakerMute [-Confirm] [-Off] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION

Sets the state of the speaker being mute.
If you pass $true to function it will turn on Mute.


## EXAMPLES

### Example 1: EXAMPLE 1

```
Set-SpeakerMute -On
```

Will turn on speaker mute





### Example 2: EXAMPLE 2

```
Set-SpeakerMute -Off
```

Will turn off speaker mute






## PARAMETERS

### -Confirm

{{ Fill Confirm Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Off

A switch parameter to determine if you want SpeakerMute off.

```yaml
Type: SwitchParameter
Parameter Sets: Off
Aliases: 
Accepted values: 

Required: True (None) False (Off)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -On

A switch parameter to determine if you want SpeakerMute on.

```yaml
Type: SwitchParameter
Parameter Sets: On
Aliases: 
Accepted values: 

Required: True (None) False (On)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -WhatIf

{{ Fill WhatIf Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### 



## NOTES

Inspired by https://stackoverflow.com/questions/255419/how-can-i-mute-unmute-my-sound-from-powershell


## RELATED LINKS

Fill Related Links Here

