---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# ConvertFrom-Base64

## SYNOPSIS
Convert from a Base64 string to normal string

## SYNTAX

```
ConvertFrom-Base64 [-Base64] <String[]> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
Convert from a Base64 string to normal string.
Function aliased to 'Base64Decode'.

## EXAMPLES

### EXAMPLE 1
```
ConvertFrom-Base64 "SABlAGwAbABvAA=="
```

Would return
Hello

### EXAMPLE 2
```
ConvertFrom-Base64 "SABlAGwAbABvAA==" -IncludeInput
```

Would return
Base64           String
------           ------
SABlAGwAbABvAA== Hello

## PARAMETERS

### -Base64
A base64 encoded string

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
Switch to enable including the input to appear in the output

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

### [string[]]
## NOTES

## RELATED LINKS
