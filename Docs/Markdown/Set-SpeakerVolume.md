---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Set-SpeakerVolume

## SYNOPSIS
Sets the speaker volume.

## SYNTAX

```
Set-SpeakerVolume [[-Volume] <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Sets the speaker volume.

## EXAMPLES

### EXAMPLE 1
```
Set-SpeakerVolume -Volume 80
```

Will display nothing and set the speaker to 80%

### EXAMPLE 2
```
Set-SpeakerVolume -Volume 60 -Verbose
```

VERBOSE: Starting \[Set-SpeakerVolume\]
VERBOSE: Setting speaker volume to \[60\]
VERBOSE: Ending \[Set-SpeakerVolume\]

## PARAMETERS

### -Volume
An integer value from 0 to 100 that will set the volume level of the speaker.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: 50
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Renamed function from Set-Speaker to Set-SpeakerVolume to be clearer as to the purpose.
Set an alias for the
function to 'Set-Speaker' for backward compatibility.

Inspired by https://stackoverflow.com/questions/255419/how-can-i-mute-unmute-my-sound-from-powershell

## RELATED LINKS
