---
external help file: PoshFunctions-help.xml
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

### EXAMPLE 1
```
Split-CanonicalName -CanonicalName 'contosco.com/Users/Mickey Mouse'
```

contosco.com/Users

### EXAMPLE 2
```
Split-CanonicalName -CanonicalName 'contosco.com/Users/Mickey Mouse' -Leaf
```

Mickey Mouse

### EXAMPLE 3
```
Split-CanonicalName -CanonicalName 'contosco.com/Users/Duck, Daffy' -Leaf
```

Duck, Daffy

### EXAMPLE 4
```
'contosco.com/Users/Duck, Daffy' | Split-CanonicalName
```

contosco.com/Users

### EXAMPLE 5
```
'contosco.com/Users/Duck, Daffy' | Split-CanonicalName -Leaf
```

Duck, Daffy

### EXAMPLE 6
```
Get-AdUser MMouse | Split-CanonicalName -Leaf
```

Mickey Mouse

### EXAMPLE 7
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
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Parent
Switch to display the parent of the distinguished name.
Default parameter

```yaml
Type: SwitchParameter
Parameter Sets: Parent
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Leaf
Switch to display the leaf of the distinguished name

```yaml
Type: SwitchParameter
Parameter Sets: Leaf
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Token
Switch to return an array of all the parts

```yaml
Type: SwitchParameter
Parameter Sets: Token
Aliases:

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

### string[]
## NOTES

## RELATED LINKS
