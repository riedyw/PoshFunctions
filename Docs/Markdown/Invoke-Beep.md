---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Invoke-Beep

## SYNOPSIS

Uses the Beep function of the .Net [Console] class

## SYNTAX

### Default (Default)

```
Invoke-Beep [-Duration <Int32>] [-Frequency <Int32>] [<CommonParameters>]
```

### Nasa

```
Invoke-Beep [-Nasa] [<CommonParameters>]
```

### StarWars

```
Invoke-Beep [-StarWars] [<CommonParameters>]
```

### Impossible

```
Invoke-Beep [-Impossible] [<CommonParameters>]
```

### Mario

```
Invoke-Beep [-Mario] [<CommonParameters>]
```

### Censor

```
Invoke-Beep [-Censor] [<CommonParameters>]
```

### Birthday

```
Invoke-Beep [-Birthday] [<CommonParameters>]
```

## DESCRIPTION

Uses the Beep function of the .Net [Console] class.
Alias as 'Beep'.
Has the
ability to play a number of different pre-defined set of tones.


## EXAMPLES

### Example 1: EXAMPLE 1

```
Invoke-Beep
```







### Example 2: EXAMPLE 2

```
Invoke-Beep -Frequency 400 -Duration 500
```







### Example 3: EXAMPLE 3

```
Invoke-Beep -Impossible
```








## PARAMETERS

### -Birthday

A switch to play Happy Birthday.

```yaml
Type: SwitchParameter
Parameter Sets: Birthday
Aliases: 
Accepted values: 

Required: True (None) False (Birthday)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Censor

A switch to play the censor beep.

```yaml
Type: SwitchParameter
Parameter Sets: Censor
Aliases: 
Accepted values: 

Required: True (None) False (Censor)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Duration

The duration, in milliseconds, that you wish to play the tone.
Defaults to 200.
Minimum 61 ms, maximum 3000 ms (3 seconds).

```yaml
Type: Int32
Parameter Sets: Default
Aliases: 
Accepted values: 

Required: True (None) False (Default)
Position: Named
Default value: 200
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Frequency

The frequency, in mHz, of the tone that you want to play.
Defaults to 800.
Minimum 37 Hz, maximum 32,767 Hz.

```yaml
Type: Int32
Parameter Sets: Default
Aliases: 
Accepted values: 

Required: True (None) False (Default)
Position: Named
Default value: 800
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Impossible

A switch to play the Mission Impossible theme.

```yaml
Type: SwitchParameter
Parameter Sets: Impossible
Aliases: 
Accepted values: 

Required: True (None) False (Impossible)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Mario

A switch to play the theme from Super Mario.

```yaml
Type: SwitchParameter
Parameter Sets: Mario
Aliases: 
Accepted values: 

Required: True (None) False (Mario)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Nasa

A switch to play the NASA beep circa Apollo.

```yaml
Type: SwitchParameter
Parameter Sets: Nasa
Aliases: 
Accepted values: 

Required: True (None) False (Nasa)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -StarWars

A switch to play the Imperial March from Star Wars.

```yaml
Type: SwitchParameter
Parameter Sets: StarWars
Aliases: 
Accepted values: 

Required: True (None) False (StarWars)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES



## RELATED LINKS

Fill Related Links Here

