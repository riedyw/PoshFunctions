---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# Convert-Int64ToText

## SYNOPSIS
Convert integer to English text

## SYNTAX

```
Convert-Int64ToText [-Number] <Int64[]> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
Convert integer to English text

## EXAMPLES

### EXAMPLE 1
```
Convert-Int64ToText -Number 13987
```

Thirteen Thousand Nine Hundred Eighty Seven

### EXAMPLE 2
```
Convert-Int64ToText -Number 1999, 2001, 2022 -IncludeInput
```

Number Result
------ ------
  1999 One Thousand Nine Hundred Ninety Nine
  2001 Two Thousand One
  2022 Two Thousand Twenty Two

### EXAMPLE 3
```
723, 4560 | Convert-Int64ToText -IncludeInput
```

Number Result
------ ------
   723 Seven Hundred Twenty Three
  4560 Four Thousand Five Hundred Sixty

## PARAMETERS

### -Number
An \[int64\] value or an array of \[int64\]

```yaml
Type: Int64[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -IncludeInput
Switch to enable the original datetime to appear in the output.
Aliased to 'IncludeOriginal'

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

## NOTES

## RELATED LINKS
