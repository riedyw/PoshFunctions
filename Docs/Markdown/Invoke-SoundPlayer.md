---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Invoke-SoundPlayer

## SYNOPSIS

Use the SoundPlayer in Powershell. Can be synchronous or asynchronous.

## SYNTAX

### __AllParameterSets

```
Invoke-SoundPlayer [[-Path <String>]] [-Async] [<CommonParameters>]
```

## DESCRIPTION

Use the SoundPlayer in Powershell.
Can be synchronous or asynchronous.


## EXAMPLES

### Example 1: EXAMPLE 1

```
Invoke-SoundPlayer
```

Will play the default sound synchronously





### Example 2: EXAMPLE 2

```
Invoke-SoundPlayer -Path C:\windows\media\Ring09.wav -Async
```

Will play the sound asynchronously






## PARAMETERS

### -Async

Switch to make the playing asynchronous.
Normally the next statement in your script
does not run until the play process is done playing the whole file.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Path

The Path to a .wav file.
Defaults to 'c:\windows\media\tada.wav'.
The file must exist, it must resolve to a single file (no wildcards) and it must end in the '.wav' extension.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: c:\windows\media\tada.wav
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES

inspired by: https://devblogs.microsoft.com/scripting/powertip-use-powershell-to-play-wav-files/


## RELATED LINKS

Fill Related Links Here

