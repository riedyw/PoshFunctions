---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# ConvertFrom-HexString

## SYNOPSIS
Convert a hex string or array of hex string to text

## SYNTAX

```
ConvertFrom-HexString [-HexString] <String[]> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
Convert a hex string or array of hex string to text

## EXAMPLES

### EXAMPLE 1
```
ConvertFrom-HexString -HexString '434241'
```

CBA

### EXAMPLE 2
```
414243 | ConvertFrom-HexString
```

ABC

### EXAMPLE 3
```
ConvertFrom-HexString -HexString '414243', '434241' -IncludeInput
```

HexString String
--------- ------
414243    ABC
434241    CBA

## PARAMETERS

### -HexString
An array of hex strings that need to be converted back to text.
Values can be passed from the pipeline.

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

## RELATED LINKS
