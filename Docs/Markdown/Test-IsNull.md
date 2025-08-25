---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version: https://gist.github.com/Nora-Ballard/11240204
schema: 2.0.0
---

# Test-IsNull

## SYNOPSIS
Given a passed \[string\] tests to determine if .IsNullOrEmpty() or .IsNullOrWhitespace(), with .IsNullOrEmpty() being the default

## SYNTAX

### Empty (Default)
```
Test-IsNull [[-String] <String>] [-Empty] [<CommonParameters>]
```

### WhiteSpace
```
Test-IsNull [[-String] <String>] [-WhiteSpace] [<CommonParameters>]
```

## DESCRIPTION
Given a passed \[string\] tests to determine if .IsNullOrEmpty() or .IsNullOrWhitespace(), with .IsNullOrEmpty() being the default

## EXAMPLES

### EXAMPLE 1
```
Test-IsNull -String ''
```

Would return
$true

### EXAMPLE 2
```
Test-IsNull -String ' '
```

Would return
$false

### EXAMPLE 3
```
Test-IsNull -String " `t " -WhiteSpace
```

Would return
$true

## PARAMETERS

### -String
A \[string\] that you wanted tested to see if Null or (Empty or WhiteSpace).
In both parameter set names 'Empty' and 'WhiteSpace'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Empty
A switch to control if looking for .IsNullOrEmpty()

```yaml
Type: SwitchParameter
Parameter Sets: Empty
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhiteSpace
A switch to control if looking for .IsNullOrWhitespace()

```yaml
Type: SwitchParameter
Parameter Sets: WhiteSpace
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

### 'bool'
## NOTES

## RELATED LINKS
