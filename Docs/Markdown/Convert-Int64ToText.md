---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Convert-Int64ToText

## SYNOPSIS

Convert integer to English text

## SYNTAX

### __AllParameterSets

```
Convert-Int64ToText [-Number] <Int64[]> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

Convert integer to English text


## EXAMPLES

### Example 1: EXAMPLE 1

```
Convert-Int64ToText -Number 13987
```

Thirteen Thousand Nine Hundred Eighty Seven





### Example 2: EXAMPLE 2

```
Convert-Int64ToText -Number 1999, 2001, 2022 -IncludeInput
```

Number Result
------ ------
  1999 One Thousand Nine Hundred Ninety Nine
  2001 Two Thousand One
  2022 Two Thousand Twenty Two





### Example 3: EXAMPLE 3

```
723, 4560 | Convert-Int64ToText -IncludeInput
```

Number Result
------ ------
   723 Seven Hundred Twenty Three
  4560 Four Thousand Five Hundred Sixty






## PARAMETERS

### -IncludeInput

Switch to enable the original datetime to appear in the output.
Aliased to 'IncludeOriginal'

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

An [int64] value or an array of [int64]

```yaml
Type: Int64[]
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

## NOTES



## RELATED LINKS

Fill Related Links Here

