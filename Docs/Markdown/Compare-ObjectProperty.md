---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Compare-ObjectProperty

## SYNOPSIS

Compares two objects property by property.

## SYNTAX

### __AllParameterSets

```
Compare-ObjectProperty [-ReferenceObject] <PSObject> [-DifferenceObject] <PSObject> [<CommonParameters>]
```

## DESCRIPTION

Compares two objects property by property.
A simple Compare-Object only compares those properties with the same name in the two objects.


## EXAMPLES

### Example 1: EXAMPLE 1

```
$a = New-Object psobject -Prop ([ordered] @{ One = 1; Two = 2})
```

$b = New-Object psobject -Prop ([ordered] @{ One = 1; Two = 2; Three = 3})

Compare-Object $a $b

# would return $null because it only compares the properties that have common names but

Compare-ObjectProperty $a $b

# would return below because it compares the two objects property by property

PropertyName RefValue DiffValue
------------ -------- ---------
Three                         3






## PARAMETERS

### -DifferenceObject

The second object to compare

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (All) False (None)
Position: 1
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -ReferenceObject

The first object to compare

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### [psobject]



## NOTES



## RELATED LINKS

[Compare-Object] ()

