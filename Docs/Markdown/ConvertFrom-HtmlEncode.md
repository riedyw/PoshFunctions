---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# ConvertFrom-HtmlEncode

## SYNOPSIS

Converts a URL encoded string back into a normal string

## SYNTAX

### __AllParameterSets

```
ConvertFrom-HtmlEncode [[-HTML <String[]>]] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

Converts a HTML encoded string back into a normal string


## EXAMPLES

### Example 1: EXAMPLE 1

```
ConvertFrom-HTMLEncode -HTML '&amp;' -IncludeInput
```

HtmlEncoded PlainText
----------- ---------
&amp;       &






## PARAMETERS

### -HTML

The encoded HTML string.
Can be a string or an array of strings.
Accepts pipeline input.

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

### -IncludeInput

A switch to enable showing original text in the output.
Aliased to 'IncludeOriginal' for backward compatibility of scripts

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


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### [string]



## NOTES

Inspired by: https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/html-encoding


## RELATED LINKS

Fill Related Links Here

