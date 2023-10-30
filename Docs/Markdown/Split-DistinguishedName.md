---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Split-DistinguishedName

## SYNOPSIS

To split a DistinguishedName string line by into its constituent parts which are separated by a comma

## SYNTAX

### Parent (Default)

```
Split-DistinguishedName [-DistinguishedName] <String[]> [-Parent] [<CommonParameters>]
```

### Token

```
Split-DistinguishedName [-DistinguishedName] <String[]> [-Token] [<CommonParameters>]
```

### Leaf

```
Split-DistinguishedName [-DistinguishedName] <String[]> [-Leaf] [<CommonParameters>]
```

## DESCRIPTION

To split a DistinguishedName string line by into its constituent parts which are separated by a comma.
Commas within
one of the constituent properties are represented by '\,'


## EXAMPLES

### Example 1: EXAMPLE 1

```
Split-DistinguishedName -DistinguishedName 'CN=Duck\, Daffy,DC=contosco,DC=com' -Leaf
```

CN=Duck\, Daffy





### Example 2: EXAMPLE 2

```
Split-DistinguishedName -DistinguishedName 'CN=Duck\, Daffy,DC=contosco,DC=com' -Parent
```

DC=contosco,DC=com





### Example 3: EXAMPLE 3

```
Split-DistinguishedName -DistinguishedName 'CN=Mickey Mouse,DC=contosco,DC=com' -Leaf
```

CN=Mickey Mouse





### Example 4: EXAMPLE 4

```
'CN=Duck\, Daffy,DC=contosco,DC=com' | Split-DistinguishedName
```

DC=contosco,DC=com





### Example 5: EXAMPLE 5

```
'CN=Duck\, Daffy,DC=contosco,DC=com' | Split-DistinguishedName -Leaf
```

CN=Duck\, Daffy





### Example 6: EXAMPLE 6

```
Split-DistinguishedName -DistinguishedName 'CN=Mickey Mouse,DC=contosco,DC=com', 'CN=Duck\, Daffy,DC=contosco,DC=com' -Leaf
```

CN=Mickey Mouse
CN=Duck\, Daffy





### Example 7: EXAMPLE 7

```
'CN=Duck\, Daffy,DC=contosco,DC=com' | Split-DistinguishedName -Token
```

CN=Duck\, Daffy
DC=contosco
DC=com






## PARAMETERS

### -DistinguishedName

The DistinguishedName string you want to parse.
Can be single string or array of strings.
Values can be passed
via the pipeline as straight text or via property name

```yaml
Type: String[]
Parameter Sets: Token, Leaf, Parent
Aliases: 
Accepted values: 

Required: True (Token, Leaf, Parent) False (None)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -Leaf

Switch to display the leaf of the distinguished name

```yaml
Type: SwitchParameter
Parameter Sets: Leaf
Aliases: 
Accepted values: 

Required: True (None) False (Leaf)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Parent

Switch to display the parent of the distinguished name.
Default parameter

```yaml
Type: SwitchParameter
Parameter Sets: Parent
Aliases: 
Accepted values: 

Required: True (None) False (Parent)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Token

Switch to return an array of all the parts

```yaml
Type: SwitchParameter
Parameter Sets: Token
Aliases: 
Accepted values: 

Required: True (None) False (Token)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### string[]



## NOTES



## RELATED LINKS

Fill Related Links Here

