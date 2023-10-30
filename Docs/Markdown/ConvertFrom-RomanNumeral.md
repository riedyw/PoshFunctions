---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# ConvertFrom-RomanNumeral

## SYNOPSIS
Converts a roman numeral to a number.

## SYNTAX

```
ConvertFrom-RomanNumeral [-Numeral] <String[]> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
Converts a roman numeral - in the range of I..MMMCMXCIX - to a number.

## EXAMPLES

### EXAMPLE 1
```
ConvertFrom-RomanNumeral -Numeral MMXIV
```

### EXAMPLE 2
```
"MMXIV" | ConvertFrom-RomanNumeral
```

## PARAMETERS

### -Numeral
A roman numeral in the range I..MMMCMXCIX (1..3,999).

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
Switch to include input values in the output

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

### System.String[]
## OUTPUTS

### System.Int32
## NOTES
Requires PowerShell version 3.0

## RELATED LINKS
