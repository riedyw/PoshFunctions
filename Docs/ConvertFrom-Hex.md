---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# ConvertFrom-Hex

## SYNOPSIS
Convert an string or string array from hexadecimal to an integer

## SYNTAX

```
ConvertFrom-Hex [-Hex] <String[]> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
Convert an string or string array from hexadecimal to an integer

## EXAMPLES

### EXAMPLE 1
```
ConvertFrom-Hex -Hex 'f0','20'
```

240
32

### EXAMPLE 2
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

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -IncludeInput
{{ Fill IncludeInput Description }}

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

### int
## NOTES
General notes

## RELATED LINKS
