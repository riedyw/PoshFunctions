---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Invoke-Speak

## SYNOPSIS

Use the speech synthesizer in Powershell. Can be synchronous or asynchronous. Option for random voice.

## SYNTAX

### __AllParameterSets

```
Invoke-Speak [-Expression] <String[]> [-Async] [-RandomVoice] [<CommonParameters>]
```

## DESCRIPTION

Use the speech synthesizer in Powershell.
Can be synchronous or asynchronous.
Option for random voice.


## EXAMPLES

### Example 1: EXAMPLE 1

```
Invoke-Speak -Expression 'Your computer is ON.'
```







### Example 2: EXAMPLE 2

```
Invoke-Speak "Your confirmation preference is $ConfirmPreference"
```







### Example 3: EXAMPLE 3

```
Invoke-Speak -Expression 'This is a really long line of text. I wonder how long it will take to speak' -Async
```








## PARAMETERS

### -Async

Switch to make the text-to-speak asynchronous.
Normally the next statement in your script
does not run until the speech process is done saying the whole expression.

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

### -Expression

Type what you want the speech synthesizer to say

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: Text
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -RandomVoice

Will select one of the installed voices at random to speak the expression.

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


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES



## RELATED LINKS

Fill Related Links Here

