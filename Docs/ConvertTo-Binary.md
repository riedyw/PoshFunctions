---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# ConvertTo-Binary

## SYNOPSIS
Convert an integer or array of integers to binary

## SYNTAX

```
ConvertTo-Binary [-Number] <Int32[]> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
Convert an integer or array of integers to binary

## EXAMPLES

### EXAMPLE 1
```
ConvertTo-Binary -Number 23
```

10111

### EXAMPLE 2
```
ConvertTo-Binary -Number 32,0xff -IncludeInput
```

Number Binary
------ ------
    32 100000
   255 11111111

## PARAMETERS

### -Number
Enter an integer value(s)

```yaml
Type: Int32[]
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

### string
## NOTES
General notes

## RELATED LINKS
