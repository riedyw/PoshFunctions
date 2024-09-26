---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# ConvertTo-Bool

## SYNOPSIS

Parse a string and convert it to a Boolean

## SYNTAX

### __AllParameterSets

```
ConvertTo-Bool [[-InputVal <String[]>]] [-IncludeInput] [-TrueString <String[]>] [<CommonParameters>]
```

## DESCRIPTION

Parse a string and convert it to a Boolean.
Function aliased to 'Parse-Bool'.


## EXAMPLES

### Example 1: EXAMPLE 1

```
ConvertTo-Bool 'true'
```

True





### Example 2: EXAMPLE 2

```
ConvertTo-Bool 't'
```

True





### Example 3: EXAMPLE 3

```
ConvertTo-Bool 'on'
```

True





### Example 4: EXAMPLE 4

```
ConvertTo-Bool 0
```

False





### Example 5: EXAMPLE 5

```
ConvertTo-Bool 1
```

Any NON-zero numeric would return
True





### Example 6: EXAMPLE 6

```
ConvertTo-Bool 'nonsense'
```

False





### Example 7: EXAMPLE 7

```
ConvertTo-Bool 'radical' -TrueString 'radical', 'cool'
```

True





### Example 8: EXAMPLE 8

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

### -IncludeInput

Determines if you wish to see the original in the output, aliased to 'IncludeOriginal'

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: IncludeOriginal
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -InputVal

The string or array of strings to be evaluated.
Accepts from the pipeline

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -TrueString

The string or array of strings that are considered as $true values.
Defaults to 'true', 'yes', 'on', 'enabled', 't', 'y'

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: @('true', 'yes', 'on', 'enabled', 't', 'y')
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### [bool]



## NOTES

ConvertTo-Bool will .Trim() the InputVal before trying to parse it.


## RELATED LINKS

[about_Properties] ()

