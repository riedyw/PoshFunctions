---
external help file: MyFunctions-help.xml
Module Name: MyFunctions
online version:
schema: 2.0.0
---

# Compare-ObjectProperty

## SYNOPSIS
Compares two objects property by property.

## SYNTAX

```
Compare-ObjectProperty [-ReferenceObject] <PSObject> [-DifferenceObject] <PSObject> [<CommonParameters>]
```

## DESCRIPTION
Compares two objects property by property.
when a simple Compare-Object does not find equivalence, for instance when the order of properties is different between the 2 objects.

## EXAMPLES

### EXAMPLE 1
```
Compare-ObjectProperty -ReferenceObject $object1 -DifferenceObject $object2
```

## PARAMETERS

### -ReferenceObject
The first object to compare

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DifferenceObject
The second object to compare

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### [psobject]

## NOTES
Author:     Bill Riedy

## RELATED LINKS

[Compare-Object

region Parameters]()

