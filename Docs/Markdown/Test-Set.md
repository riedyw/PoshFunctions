---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Test-Set

## SYNOPSIS

Compares 2 arrays of strings and determines if they are EQUAL, SUBSET, SUPERSET, or UNEQUAL

## SYNTAX

### __AllParameterSets

```
Test-Set [[-ReferenceObject <String[]>]] [[-DifferenceObject <String[]>]] [-CaseSensitive] [<CommonParameters>]
```

## DESCRIPTION

Compares 2 arrays of strings and determines if they are EQUAL, SUBSET, SUPERSET, or UNEQUAL.
Optionally case sensitive


## EXAMPLES

### Example 1: EXAMPLE 1

```
Test-Set -ReferenceObject a,b,c -DifferenceObject a,c -CaseSensitive
```

Subset





### Example 2: EXAMPLE 2

```
Test-Set -ReferenceObject a,b,c -DifferenceObject a,b,C -CaseSensitive
```

NotEqual





### Example 3: EXAMPLE 3

```
Test-Set -ReferenceObject a,b,c -DifferenceObject a,b,c,D
```

SuperSet





### Example 4: EXAMPLE 4

```
Test-Set -ReferenceObject a,b,c -DifferenceObject a,b,C
```

Equal






## PARAMETERS

### -CaseSensitive

Switch indicating that a case sensitive comparison should be made.
Aliased to 'CS'

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: CS
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -DifferenceObject

The array that is being compared to the baseline set.
Aliased to 'DO', 'Right'

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: DO,Right
Accepted values: 

Required: True (None) False (All)
Position: 1
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -ReferenceObject

The array that is the baseline.
Aliased to 'RO', 'Left'

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: RO,Left
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### string



## NOTES



## RELATED LINKS

Fill Related Links Here

