---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Format-RandomCase

## SYNOPSIS
Formats a string character by character randomly into upper or lower case.

## SYNTAX

```
Format-RandomCase [[-String] <String[]>] [<CommonParameters>]
```

## DESCRIPTION
Formats a string character by character randomly into upper or lower case.

## EXAMPLES

### EXAMPLE 1
```
Format-RandomCase -String 'HELLO WORLD IT IS ME!'
```

Example return
HelLo worlD It is me!

## PARAMETERS

### -String
A \[string\[\]\] that you want formatted randomly into upper or lower case

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### [string[]]
## NOTES
If you need to specify 10 or more of a particular type of dice use several entries of that dice type that add up to the value you want.

You want to know results of rolling ten 6-sided dice

Get-DiceRoll -Dice 2d6,8d6

## RELATED LINKS
