---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Test-IsNumeric

## SYNOPSIS

Determines if specified string can be parsed to a number

## SYNTAX

### __AllParameterSets

```
Test-IsNumeric [[-NumString <String[]>]] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

Determines if specified string can be parsed to a number.
Can specify a string, an array of strings, or input from the pipeline


## EXAMPLES

### Example 1: EXAMPLE 1

```
Test-IsNumeric '1.2'
```

True





### Example 2: EXAMPLE 2

```
Test-IsCapsLock -Verbose
```








## PARAMETERS

### -IncludeInput

Switch to include the input parameters in the output

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

### -NumString

A string or string array to test to determine if they are numeric.
Aliased as 'Number'

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: Number
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

### bool



## NOTES



## RELATED LINKS

Fill Related Links Here

