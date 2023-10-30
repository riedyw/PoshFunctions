---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# ConvertTo-Binary

## SYNOPSIS

Convert an integer or array of integers to binary

## SYNTAX

### __AllParameterSets

```
ConvertTo-Binary [-Number] <UInt64[]> [-IncludeInput] [-MinimumWidth <Int32>] [<CommonParameters>]
```

## DESCRIPTION

Convert an integer or array of integers to binary


## EXAMPLES

### Example 1: EXAMPLE 1

```
ConvertTo-Binary -Number 23
```

10111





### Example 2: EXAMPLE 2

```
ConvertTo-Binary -Number 32,0xff -IncludeInput
```

Number Binary
------ ------
    32 100000
   255 11111111





### Example 3: EXAMPLE 3

```
ConvertTo-binary -Number 32,0xff -IncludeInput -MinimumWidth 16
```

Number Binary
------ ------
    32 0000000000100000
   255 0000000011111111






## PARAMETERS

### -IncludeInput

Switch indicating that you want the input to be included in the output

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

### -MinimumWidth

Minimum number of characters that the binary representation will be.
The binary number could be longer than the minimum width.
Aliased to 'Width'.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: Width
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Number

An array of integers that you want converted to binary

```yaml
Type: UInt64[]
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

## OUTPUTS

### string



## NOTES

Changed to use unsigned 64 bit values so that larger numbers can be processed


## RELATED LINKS

Fill Related Links Here

