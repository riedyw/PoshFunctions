---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# ConvertTo-Binary

## SYNOPSIS
Convert an integer or array of integers to binary

## SYNTAX

```
ConvertTo-Binary [-Number] <UInt64[]> [-MinimumWidth <Int32>] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
Convert an integer or array of integers to binary

## EXAMPLES

### EXAMPLE 1
```
ConvertTo-Binary -Number 23
```

10111

### EXAMPLE 2
```
ConvertTo-Binary -Number 32,0xff -IncludeInput
```

Number Binary
------ ------
    32 100000
   255 11111111

### EXAMPLE 3
```
ConvertTo-binary -Number 32,0xff -IncludeInput -MinimumWidth 16
```

Number Binary
------ ------
    32 0000000000100000
   255 0000000011111111

## PARAMETERS

### -Number
An array of integers that you want converted to binary

```yaml
Type: UInt64[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -MinimumWidth
Minimum number of characters that the binary representation will be.
The binary number could be longer than the minimum width.
Aliased to 'Width'.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: Width

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeInput
Switch indicating that you want the input to be included in the output

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

### string
## NOTES
Changed to use unsigned 64 bit values so that larger numbers can be processed

## RELATED LINKS
