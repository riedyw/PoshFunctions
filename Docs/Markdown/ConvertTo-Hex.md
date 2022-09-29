---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# ConvertTo-Hex

## SYNOPSIS
Convert an integer or array of integers to hexadecimal

## SYNTAX

```
ConvertTo-Hex [-Number] <UInt64[]> [-MinimumWidth <Int32>] [-Prefix <String>] [-IncludeInput]
 [<CommonParameters>]
```

## DESCRIPTION
Convert an integer or array of integers to hexadecimal

## EXAMPLES

### EXAMPLE 1
```
ConvertTo-Hex -Number 23
```

17

### EXAMPLE 2
```
ConvertTo-Hex -Number 32,32769 -IncludeInput
```

Number Hex
------ ---
    32 20
 32769 8001

### EXAMPLE 3
```
ConvertTo-Hex -Number 32, 32769 -IncludeInput -MinimumWidth 4 -Prefix '0x'
```

Number Hex
------ ---
    32 0x0020
 32769 0x8001

### EXAMPLE 4
```
ConvertTo-Hex -Number 128 -Prefix '#' -MinimumWidth 6
```

#000080

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

### -Prefix
A string indicating the prefix you want included with the hex number.
ValidateSet '0x', or '#'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
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
