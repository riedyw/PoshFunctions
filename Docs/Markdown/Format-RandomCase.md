---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Format-RandomCase

## SYNOPSIS

Formats a string character by character randomly into upper or lower case.

## SYNTAX

### __AllParameterSets

```
Format-RandomCase [[-String <String[]>]] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

Formats a string character by character randomly into upper or lower case.


## EXAMPLES

### Example 1: EXAMPLE 1

```
Format-RandomCase -String 'HELLO WORLD IT IS ME!'
```

Example return
HelLo worlD It is me!





### Example 2: EXAMPLE 2

```
Format-RandomCase -String HELLO, WORLD, IT, IS, ME -IncludeInput
```

Example return
Original Return
-------- ------
HELLO    hELLo
WORLD    wORLd
IT       It
IS       is
ME       ME






## PARAMETERS

### -IncludeInput

Switch that will display input parameters in the output

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

### -String

A [string[]] that you want formatted randomly into upper or lower case

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### [string[]]



## NOTES



## RELATED LINKS

Fill Related Links Here

