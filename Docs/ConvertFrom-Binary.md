---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# ConvertFrom-Binary

## SYNOPSIS
Convert an string or string array from binary to an integer

## SYNTAX

```
ConvertFrom-Binary [-Binary] <String[]> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
Convert an string or string array from binary to an integer

## EXAMPLES

### EXAMPLE 1
```
ConvertFrom-Binary -Binary 100001
```

33

### EXAMPLE 2
```
ConvertFrom-Binary -Binary 1001 -include
```

Binary Number
------ ------
1001        9

## PARAMETERS

### -Binary
Enter a binary string

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -IncludeInput
{{ Fill IncludeInput Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
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

### int
## NOTES
General notes

## RELATED LINKS
