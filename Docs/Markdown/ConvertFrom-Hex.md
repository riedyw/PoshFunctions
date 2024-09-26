---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# ConvertFrom-Hex

## SYNOPSIS

Convert an string or string array from hexadecimal to an integer

## SYNTAX

### __AllParameterSets

```
ConvertFrom-Hex [-Hex] <String[]> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

Convert an string or string array from hexadecimal to an integer


## EXAMPLES

### Example 1: EXAMPLE 1

```
ConvertFrom-Hex -Hex 'f0','20'
```

240
32





### Example 2: EXAMPLE 2

```
ConvertFrom-Hex -Hex '0xff','20' -IncludeInput
```

Hex  Number
---  ------
0xff    255
20       32






## PARAMETERS

### -Hex

Enter a hexadecimal string

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

### -IncludeInput

{{ Fill IncludeInput Description }}

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

## OUTPUTS

### int



## NOTES

Changed to use unsigned 64 bit values so that larger numbers can be processed


## RELATED LINKS

Fill Related Links Here

