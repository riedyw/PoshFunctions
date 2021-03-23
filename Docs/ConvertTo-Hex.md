---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# ConvertTo-Hex

## SYNOPSIS
Convert an integer or array of integers to binary

## SYNTAX

```
ConvertTo-Hex [-Number] <Int32[]> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
Convert an integer or array of integers to binary

## EXAMPLES

### EXAMPLE 1
```
ConvertTo-Hex-Number 23
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

## PARAMETERS

### -Number
{{ Fill Number Description }}

```yaml
Type: Int32[]
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

### string
## NOTES
General notes

## RELATED LINKS
