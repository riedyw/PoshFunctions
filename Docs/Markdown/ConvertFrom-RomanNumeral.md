---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# ConvertFrom-RomanNumeral

## SYNOPSIS

Converts a roman numeral to a number.

## SYNTAX

### __AllParameterSets

```
ConvertFrom-RomanNumeral [-Numeral] <String[]> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

Converts a roman numeral - in the range of I..MMMCMXCIX - to a number.


## EXAMPLES

### Example 1: EXAMPLE 1

```
ConvertFrom-RomanNumeral -Numeral MMXIV
```







### Example 2: EXAMPLE 2

```
"MMXIV" | ConvertFrom-RomanNumeral
```








## PARAMETERS

### -IncludeInput

Switch to include input values in the output

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

### -Numeral

A roman numeral in the range I..MMMCMXCIX (1..3,999).

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String[]



## OUTPUTS

### System.Int32



## NOTES

Requires PowerShell version 3.0


## RELATED LINKS

Fill Related Links Here

