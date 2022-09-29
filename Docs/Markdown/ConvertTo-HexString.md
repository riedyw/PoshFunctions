---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# ConvertTo-HexString

## SYNOPSIS
Convert a string or array of string to hex strings

## SYNTAX

```
ConvertTo-HexString [-String] <String[]> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
Convert a string or array of string to hex strings

## EXAMPLES

### EXAMPLE 1
```
ConvertTo-HexString -String 'CBA'
```

434241

### EXAMPLE 2
```
'ABC' | ConvertTo-HexString
```

414243

### EXAMPLE 3
```
'ABC', 'abc' | ConvertTo-HexString  -IncludeInput
```

String HexString
------ ---------
ABC    414243
abc    616263

## PARAMETERS

### -String
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
