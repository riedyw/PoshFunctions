---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Write-StringHash

## SYNOPSIS

Takes [hashtable] input and writes the code that would create a hashtable with that information.

## SYNTAX

### __AllParameterSets

```
Write-StringHash [-Hash] <PSObject> [[-VariableName <String>]] [-Ordered] [-QuoteField] [<CommonParameters>]
```

## DESCRIPTION

Takes [hashtable] input and writes the code that would create a hashtable with that information.


## EXAMPLES

### Example 1: EXAMPLE 1

```
@{ A =1; B=2; C=3} | Write-StringHash
```

$StringHash = @{
    C = 3
    B = 2
    A = 1
}





### Example 2: EXAMPLE 2

```
@{ A =1; B=2; C=3} | Write-StringHash -QuoteField
```

$StringHash = @{
    'C' = '3'
    'B' = '2'
    'A' = '1'
}





### Example 3: EXAMPLE 3

```
@{ A =1; B=2; C=3} | Write-StringHash -Ordered
```

$StringHash = ([ordered] @{
    A = 1
    B = 2
    C = 3
})





### Example 4: EXAMPLE 4

```
@{A =1; C=3; B=2} | Write-StringHash -Ordered -VariableName MyHashTable
```

$MyHashTable = ([ordered] @{
    A = 1
    B = 2
    C = 3
})






## PARAMETERS

### -Hash

The hash to be defined.
Can either by [System.Collections.Hashtable] or [System.Collections.Specialized.OrderedDictionary]

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -Ordered

Switch to use [ordered] when created hash, will sort entries by value

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -QuoteField

Switch to enclose the name and value attributes in single quotes

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -VariableName

The name of the hash table variable

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 1
Default value: StringHash
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### [string[]]



## NOTES



## RELATED LINKS

Fill Related Links Here

