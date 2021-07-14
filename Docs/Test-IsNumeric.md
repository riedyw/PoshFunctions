---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Test-IsNumeric

## SYNOPSIS
Determines if specified string can be parsed to a number

## SYNTAX

```
Test-IsNumeric [[-NumString] <String[]>] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
Determines if specified string can be parsed to a number.
Can specify a string, an array of strings, or input from the pipeline

## EXAMPLES

### EXAMPLE 1
```
Test-IsNumeric '1.2'
```

True

### EXAMPLE 2
```
Test-IsCapsLock -Verbose
```

## PARAMETERS

### -NumString
A string or string array to test to determine if they are numeric.
Aliased as 'Number'

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: Number

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -IncludeInput
Switch to include the input parameters in the output

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

### bool
## NOTES

## RELATED LINKS
