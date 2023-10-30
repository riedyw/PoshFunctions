---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# ConvertTo-RomanNumeral

## SYNOPSIS

Converts a number to a Roman numeral.

## SYNTAX

### __AllParameterSets

```
ConvertTo-RomanNumeral [-Number] <Int32[]> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

Converts a number - in the range of 1 to 3,999 - to a Roman numeral.


## EXAMPLES

### Example 1: EXAMPLE 1

```
ConvertTo-RomanNumeral -Number 1999
```

MCMXCIX





### Example 2: EXAMPLE 2

```
2002 | ConvertTo-RomanNumeral
```

MMII





### Example 3: EXAMPLE 3

```
ConvertTo-RomanNumeral 1918,1945 -IncludeInput
```

Number RomanNumeral
------ ------------
1918 MCMXVIII
1945 MCMXLV






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

### -Number

An integer in the range 1 to 3,999.

```yaml
Type: Int32[]
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

### System.Int32[]



## OUTPUTS

### System.String



## NOTES



## RELATED LINKS

Fill Related Links Here

