---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# ConvertTo-OrderedDictionary

## SYNOPSIS

Converts a HashTable, Array, or an OrderedDictionary to an OrderedDictionary.

## SYNTAX

### __AllParameterSets

```
ConvertTo-OrderedDictionary [-Hash] <Hashtable> [<CommonParameters>]
```

## DESCRIPTION

ConvertTo-OrderedDictionary takes a HashTable, Array, or an OrderedDictionary
and returns an ordered dictionary.

If you enter a hash table, the keys in the hash table are ordered
alphanumerically in the dictionary.
If you enter an array, the keys
are integers 0 - n.


## EXAMPLES

### Example 1: EXAMPLE 1

```
$myHash = @{a=1; b=2; c=3}
```

ConvertTo-OrderedDictionary -Hash $myHash

Name                           Value
----                           -----
a                              1
b                              2
c                              3





### Example 2: EXAMPLE 2

```
$myHash = @{a=1; b=2; c=3}
```

$myHash = .\ConvertTo-OrderedDictionary.ps1 -Hash $myHash
$myHash

Name                           Value
----                           -----
a                              1
b                              2
c                              3

$myHash | Get-Member

TypeName: System.Collections.Specialized.OrderedDictionary
.
.
.





### Example 3: EXAMPLE 3

```
$colors = "red", "green", "blue"
```

$colors = .\ConvertTo-OrderedDictionary.ps1 -Hash $colors
$colors

Name                           Value
----                           -----
0                              red
1                              green
2                              blue






## PARAMETERS

### -Hash

Specifies a hash table or an array.
Enter the hash table or array,
or enter a variable that contains a hash table or array.
If the input
is an OrderedDictionary the key order is the same in the copy.

```yaml
Type: Hashtable
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


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Collections.Hashtable
System.Array
System.Collections.Specialized.OrderedDictionary



## OUTPUTS

### System.Collections.Specialized.OrderedDictionary



## NOTES

source: https://gallery.technet.microsoft.com/scriptcenter/ConvertTo-OrderedDictionary-cf2404ba
converted to function and added ability to copy OrderedDictionary


## RELATED LINKS

[about_hash_tables] ()

