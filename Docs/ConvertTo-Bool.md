---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# ConvertTo-Bool

## SYNOPSIS
Parse a string and convert it to a Boolean

## SYNTAX

```
ConvertTo-Bool [[-InputVal] <String[]>] [-TrueString <String[]>] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
Parse a string and convert it to a Boolean

## EXAMPLES

### EXAMPLE 1
```
ConvertTo-Bool 'true'
```

True

### EXAMPLE 2
```
ConvertTo-Bool 't'
```

True

### EXAMPLE 3
```
ConvertTo-Bool 'on'
```

True

### EXAMPLE 4
```
ConvertTo-Bool 0
```

False

### EXAMPLE 5
```
ConvertTo-Bool 1
```

Any NON-zero numeric would return
True

### EXAMPLE 6
```
ConvertTo-Bool 'nonsense'
```

False

### EXAMPLE 7
```
ConvertTo-Bool 'radical' -TrueString 'radical', 'cool'
```

True

### EXAMPLE 8
```
'0',1,2,'t','enabled','darn','on' | ConvertTo-Bool -IncludeInput
```

Original  Bool TrueString
--------  ---- ----------
0        False true, yes, on, enabled, t, y
1         True true, yes, on, enabled, t, y
2         True true, yes, on, enabled, t, y
t         True true, yes, on, enabled, t, y
enabled   True true, yes, on, enabled, t, y
darn     False true, yes, on, enabled, t, y
on        True true, yes, on, enabled, t, y

## PARAMETERS

### -InputVal
The string or array of strings to be evaluated.
Accepts from the pipeline

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -TrueString
The string or array of strings that are considered as $true values.
Defaults to 'true', 'yes', 'on', 'enabled', 't', 'y'

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: @('true', 'yes', 'on', 'enabled', 't', 'y')
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeInput
Determines if you wish to see the original in the output, aliased to 'IncludeOriginal'

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: IncludeOriginal

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

### [bool]
## NOTES
ConvertTo-Bool will .Trim() the InputVal before trying to parse it.

## RELATED LINKS

[about_Properties]()

