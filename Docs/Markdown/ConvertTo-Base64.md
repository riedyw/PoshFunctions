---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# ConvertTo-Base64

## SYNOPSIS
ConvertTo-Base64 converts a normal string to a base 64 string

## SYNTAX

```
ConvertTo-Base64 [[-String] <String[]>] [[-EncodingType] <String>] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
ConvertTo-Base64 converts a normal string to a base 64 string.
Function
aliased to 'Base64Encode'.

## EXAMPLES

### EXAMPLE 1
```
ConvertTo-Base64 -String 'Password'
```

Would return
UABhAHMAcwB3AG8AcgBkAA==

### EXAMPLE 2
```
ConvertTo-Base64 -String Hello,Goodbye -IncludeInput
```

String  Base64
------  ------
Hello   SABlAGwAbABvAA==
Goodbye RwBvAG8AZABiAHkAZQA=

## PARAMETERS

### -String
The string you want manipulated

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -EncodingType
{{ Fill EncodingType Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: Unicode
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeInput
Switch to enable input parameters to appear in output

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

[about_Properties]()

