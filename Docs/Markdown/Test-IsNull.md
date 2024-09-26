---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Test-IsNull

## SYNOPSIS

Given a passed [string] tests to determine if .IsNullOrEmpty() or .IsNullOrWhitespace(), with .IsNullOrEmpty() being the default

## SYNTAX

### Empty (Default)

```
Test-IsNull [[-String <String>]] [-Empty] [<CommonParameters>]
```

### WhiteSpace

```
Test-IsNull [[-String <String>]] [-WhiteSpace] [<CommonParameters>]
```

## DESCRIPTION

Given a passed [string] tests to determine if .IsNullOrEmpty() or .IsNullOrWhitespace(), with .IsNullOrEmpty() being the default


## EXAMPLES

### Example 1: EXAMPLE 1

```
Test-IsNull -String ''
```

Would return
$true





### Example 2: EXAMPLE 2

```
Test-IsNull -String ' '
```

Would return
$false





### Example 3: EXAMPLE 3

```
Test-IsNull -String " `t " -WhiteSpace
```

Would return
$true






## PARAMETERS

### -Empty

A switch to control if looking for .IsNullOrEmpty()

```yaml
Type: SwitchParameter
Parameter Sets: Empty
Aliases: 
Accepted values: 

Required: True (None) False (Empty)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -String

A [string] that you wanted tested to see if Null or (Empty or WhiteSpace).
In both parameter set names 'Empty' and 'WhiteSpace'

```yaml
Type: String
Parameter Sets: WhiteSpace, Empty
Aliases: 
Accepted values: 

Required: True (None) False (WhiteSpace, Empty)
Position: 0
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -WhiteSpace

A switch to control if looking for .IsNullOrWhitespace()

```yaml
Type: SwitchParameter
Parameter Sets: WhiteSpace
Aliases: 
Accepted values: 

Required: True (None) False (WhiteSpace)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### 'bool'



## NOTES



## RELATED LINKS

Fill Related Links Here

