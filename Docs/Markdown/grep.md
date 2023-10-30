---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# grep

## SYNOPSIS

A simple text filter to search for a string

## SYNTAX

### __AllParameterSets

```
grep [[-String <String[]>]] [[-Keyword <String>]] [<CommonParameters>]
```

## DESCRIPTION

A simple text filter to search for a string


## EXAMPLES

### Example 1: EXAMPLE 1

```
'Hello','There' | grep 'Hello'
```

Would return
Hello






## PARAMETERS

### -Keyword

The string searching for

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 1
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -String

{{ Fill String Description }}

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


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### [string]



## NOTES



## RELATED LINKS

[about_Functions] ()

