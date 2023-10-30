---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Remove-Trailing

## SYNOPSIS

Removes trailing spaces from a string or array of strings.

## SYNTAX

### __AllParameterSets

```
Remove-Trailing [-String] <String[]> [<CommonParameters>]
```

## DESCRIPTION

Removes trailing spaces from a string or array of strings.


## EXAMPLES

### Example 1: EXAMPLE 1

```
"[$(Remove-Trailing -String 'This has trailing spaces    ')]"
```

[This has trailing spaces]






## PARAMETERS

### -String

A string or array of strings that may have trailing spaces.
Can also accept input from the pipeline.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### System.String[]



## NOTES



## RELATED LINKS

Fill Related Links Here

