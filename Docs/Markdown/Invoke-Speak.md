---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version: https://www.Google.com
schema: 2.0.0
---

# Invoke-Speak

## SYNOPSIS
Use the speech synthesizer in Powershell.
Can be synchronous or asynchronous.
Option for random voice.

## SYNTAX

```
Invoke-Speak [-Expression] <String[]> [-Async] [-RandomVoice] [<CommonParameters>]
```

## DESCRIPTION
Use the speech synthesizer in Powershell.
Can be synchronous or asynchronous.
Option for random voice.

## EXAMPLES

### EXAMPLE 1
```
Invoke-Speak -Expression 'Your computer is ON.'
```

### EXAMPLE 2
```
Invoke-Speak "Your confirmation preference is $ConfirmPreference"
```

### EXAMPLE 3
```
Invoke-Speak -Expression 'This is a really long line of text. I wonder how long it will take to speak' -Async
```

## PARAMETERS

### -Expression
Type what you want the speech synthesizer to say

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: Text

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Async
Switch to make the text-to-speak asynchronous.
Normally the next statement in your script
does not run until the speech process is done saying the whole expression.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -RandomVoice
Will select one of the installed voices at random to speak the expression.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

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

## NOTES

## RELATED LINKS
