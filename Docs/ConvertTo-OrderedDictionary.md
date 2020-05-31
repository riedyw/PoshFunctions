---
external help file: MyFunctions-help.xml
Module Name: MyFunctions
online version:
schema: 2.0.0
---

# ConvertTo-OrderedDictionary

## SYNOPSIS
Converts a HashTable, Array, or an OrderedDictionary to an OrderedDictionary.

## SYNTAX

```
ConvertTo-OrderedDictionary [-Hash] <Object> [<CommonParameters>]
```

## DESCRIPTION
ConvertTo-OrderedDictionary takes a HashTable, Array, or an OrderedDictionary
and returns an ordered dictionary.

If you enter a hash table, the keys in the hash table are ordered
alphanumerically in the dictionary.
If you enter an array, the keys
are integers 0 - n.

## EXAMPLES

### EXAMPLE 1
```
$myHash = @{a=1; b=2; c=3}
```

PS C:\\\> .\ConvertTo-OrderedDictionary.ps1 -Hash $myHash

Name                           Value
----                           -----
a                              1
b                              2
c                              3

### EXAMPLE 2
```
$myHash = @{a=1; b=2; c=3}
```

PS C:\\\> $myHash = .\ConvertTo-OrderedDictionary.ps1 -Hash $myHash
PS C:\\\> $myHash

Name                           Value
----                           -----
a                              1
b                              2
c                              3

PS C:\\\> $myHash | Get-Member

   TypeName: System.Collections.Specialized.OrderedDictionary
   .
. .

### EXAMPLE 3
```
$colors = "red", "green", "blue"
```

PS C:\\\> $colors = .\ConvertTo-OrderedDictionary.ps1 -Hash $colors
PS C:\\\> $colors

Name                           Value
----                           -----
0                              red
1                              green
2                              blue

## PARAMETERS

### -Hash
{{Fill Hash Description}}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Collections.Hashtable
System.Array
System.Collections.Specialized.OrderedDictionary

## OUTPUTS

### System.Collections.Specialized.OrderedDictionary

## NOTES

## RELATED LINKS

[about_hash_tables]()

