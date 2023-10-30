---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Split-CanonicalName

## SYNOPSIS

To split a CanonicalName string line by into its constituent parts which are separated by a /

## SYNTAX

### Parent (Default)

```
Split-CanonicalName [-CanonicalName] <String[]> [-Parent] [<CommonParameters>]
```

### Token

```
Split-CanonicalName [-CanonicalName] <String[]> [-Token] [<CommonParameters>]
```

### Leaf

```
Split-CanonicalName [-CanonicalName] <String[]> [-Leaf] [<CommonParameters>]
```

## DESCRIPTION

To split a CanonicalName string line by into its constituent parts which are separated by a /.
Slashes within
one of the constituent properties are represented by '\/'


## EXAMPLES

### Example 1: EXAMPLE 1

```
Split-CanonicalName -CanonicalName 'contosco.com/Users/Mickey Mouse'
```

contosco.com/Users





### Example 2: EXAMPLE 2

```
Split-CanonicalName -CanonicalName 'contosco.com/Users/Mickey Mouse' -Leaf
```

Mickey Mouse





### Example 3: EXAMPLE 3

```
Split-CanonicalName -CanonicalName 'contosco.com/Users/Duck, Daffy' -Leaf
```

Duck, Daffy





### Example 4: EXAMPLE 4

```
'contosco.com/Users/Duck, Daffy' | Split-CanonicalName
```

contosco.com/Users





### Example 5: EXAMPLE 5

```
'contosco.com/Users/Duck, Daffy' | Split-CanonicalName -Leaf
```

Duck, Daffy





### Example 6: EXAMPLE 6

```
Get-AdUser MMouse | Split-CanonicalName -Leaf
```

Mickey Mouse





### Example 7: EXAMPLE 7

```
'contosco.com/Users/Duck, Daffy' | Split-CanonicalName -Token
```

contosco.com
Users
Duck, Daffy






## PARAMETERS

### -CanonicalName

The CanonicalName string you want to parse.
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

