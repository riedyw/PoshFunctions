---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Set-SpeakerMute

## SYNOPSIS
Sets the state of the speaker being mute.
If you pass $true to function it will turn on Mute.

## SYNTAX

### On (Default)
```
Set-SpeakerMute [-On] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Off
```
Set-SpeakerMute [-Off] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Sets the state of the speaker being mute.
If you pass $true to function it will turn on Mute.

## EXAMPLES

### EXAMPLE 1
```
Set-SpeakerMute -On
```

Will turn on speaker mute

### EXAMPLE 2
```
Set-SpeakerMute -Off
```

Will turn off speaker mute

## PARAMETERS

### -On
A switch parameter to determine if you want SpeakerMute on.

```yaml
Type: SwitchParameter
Parameter Sets: On
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Off
A switch parameter to determine if you want SpeakerMute off.

```yaml
Type: SwitchParameter
Parameter Sets: Off
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Inspired by https://stackoverflow.com/questions/255419/how-can-i-mute-unmute-my-sound-from-powershell

## RELATED LINKS
