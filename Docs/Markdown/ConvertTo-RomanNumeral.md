---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# ConvertTo-RomanNumeral

## SYNOPSIS
Converts a number to a Roman numeral.

## SYNTAX

```
ConvertTo-RomanNumeral [-Number] <Int32[]> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
Converts a number - in the range of 1 to 3,999 - to a Roman numeral.

## EXAMPLES

### EXAMPLE 1
```
ConvertTo-RomanNumeral -Number 1999
```

MCMXCIX

### EXAMPLE 2
```
2002 | ConvertTo-RomanNumeral
```

MMII

### EXAMPLE 3
```
ConvertTo-RomanNumeral 1918,1945 -IncludeInput
```

Number RomanNumeral
------ ------------
1918 MCMXVIII
1945 MCMXLV

## PARAMETERS

### -Number
An integer in the range 1 to 3,999.

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

### System.Int32[]
## OUTPUTS

### System.String
## NOTES

## RELATED LINKS
