---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Parse-Bool

## SYNOPSIS
Parse a string and convert it to a Boolean

## SYNTAX

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
'0',1,2,'t','enabled','darn','on' | ConvertTo-Bool -IncludeOriginal
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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### [bool]
## NOTES
ConvertTo-Bool will .Trim() the InputVal before trying to parse it.

## RELATED LINKS

[about_Properties]()

