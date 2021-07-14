---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Test-Set

## SYNOPSIS
Compares 2 arrays of strings and determines if they are EQUAL, SUBSET, SUPERSET, or UNEQUAL

## SYNTAX

```
Test-Set [[-ReferenceObject] <String[]>] [[-DifferenceObject] <String[]>] [-CaseSensitive] [<CommonParameters>]
```

## DESCRIPTION
Compares 2 arrays of strings and determines if they are EQUAL, SUBSET, SUPERSET, or UNEQUAL.
Optionally case sensitive

## EXAMPLES

### EXAMPLE 1
```
Test-Set -ReferenceObject a,b,c -DifferenceObject a,c -CaseSensitive
```

Subset

### EXAMPLE 2
```
Test-Set -ReferenceObject a,b,c -DifferenceObject a,b,C -CaseSensitive
```

NotEqual

### EXAMPLE 3
```
Test-Set -ReferenceObject a,b,c -DifferenceObject a,b,c,D
```

SuperSet

### EXAMPLE 4
```
Test-Set -ReferenceObject a,b,c -DifferenceObject a,b,C
```

Equal

## PARAMETERS

### -ReferenceObject
The array that is the baseline.
Aliased to 'RO', 'Left'

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: RO, Left

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DifferenceObject
The array that is being compared to the baseline set.
Aliased to 'DO', 'Right'

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: DO, Right

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CaseSensitive
Switch indicating that a case sensitive comparison should be made.
Aliased to 'CS'

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: CS

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
