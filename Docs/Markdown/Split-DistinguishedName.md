---
external help file: PoshFunctions-help.xml
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

### EXAMPLE 1
```
Split-DistinguishedName -DistinguishedName 'CN=Duck\, Daffy,DC=contosco,DC=com' -Leaf
```

CN=Duck\, Daffy

### EXAMPLE 2
```
Split-DistinguishedName -DistinguishedName 'CN=Duck\, Daffy,DC=contosco,DC=com' -Parent
```

DC=contosco,DC=com

### EXAMPLE 3
```
Split-DistinguishedName -DistinguishedName 'CN=Mickey Mouse,DC=contosco,DC=com' -Leaf
```

CN=Mickey Mouse

### EXAMPLE 4
```
'CN=Duck\, Daffy,DC=contosco,DC=com' | Split-DistinguishedName
```

DC=contosco,DC=com

### EXAMPLE 5
```
'CN=Duck\, Daffy,DC=contosco,DC=com' | Split-DistinguishedName -Leaf
```

CN=Duck\, Daffy

### EXAMPLE 6
```
Split-DistinguishedName -DistinguishedName 'CN=Mickey Mouse,DC=contosco,DC=com', 'CN=Duck\, Daffy,DC=contosco,DC=com' -Leaf
```

CN=Mickey Mouse
CN=Duck\, Daffy

### EXAMPLE 7
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
