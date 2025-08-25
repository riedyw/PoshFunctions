---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Compare-ObjectSetUnion

## SYNOPSIS
Compares 2 arrays of strings and returns The SET UNION of the arrays

## SYNTAX

```
Compare-ObjectSetUnion [[-ReferenceObject] <String[]>] [[-DifferenceObject] <String[]>] [-CaseSensitive]
 [<CommonParameters>]
```

## DESCRIPTION
Compares 2 arrays of strings and returns The SET UNION of the arrays.
Optionally case sensitive.

## EXAMPLES

### EXAMPLE 1
```
Compare-ObjectSetUnion -ReferenceObject a,b,c -DifferenceObject a,c -CaseSensitive
```

a
c
b

### EXAMPLE 2
```
Compare-ObjectSetUnion -ReferenceObject a,b,c -DifferenceObject a,b,C -CaseSensitive
```

a
b
C
c

### EXAMPLE 3
```
Compare-ObjectSetUnion -ReferenceObject a,b,c -DifferenceObject a,b,c,D
```

a
b
c
D

### EXAMPLE 4
```
Compare-ObjectSetUnion -ReferenceObject a,b,c -DifferenceObject a,b,C
```

a
b
c

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

### psobject
## NOTES
Inspired by:
https://sqljana.wordpress.com/2015/09/23/perform-set-operations-union-intersection-minus-complement-using-powershell/
http://www.cs.odu.edu/~toida/nerzic/content/set/set_operations.html
http://www.dummies.com/how-to/content/find-the-union-intersection-relative-complement-an.html

## RELATED LINKS
