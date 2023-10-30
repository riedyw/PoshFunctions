---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# sed

## SYNOPSIS

A simple text filter to replace strings

## SYNTAX

### __AllParameterSets

```
sed [-Before] <String> [-After] <String> [<CommonParameters>]
```

## DESCRIPTION

A simple text filter to replace strings


## EXAMPLES

### Example 1: EXAMPLE 1

```
'Hello There' | sed 'Hello' 'Goodbye'
```

Would return
Goodbye There






## PARAMETERS

### -After

The string to replace it with

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (All) False (None)
Position: 1
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Before

The string searching for

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### [string]



## NOTES



## RELATED LINKS

Fill Related Links Here

