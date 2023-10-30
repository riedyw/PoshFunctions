---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# ConvertTo-UrlEncode

## SYNOPSIS

To encode plaintext using [Web.HttpUtility]::UrlEncode()

## SYNTAX

### __AllParameterSets

```
ConvertTo-UrlEncode [[-URL <String[]>]] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

To encode plaintext using [Web.HttpUtility]::UrlEncode()


## EXAMPLES

### Example 1: EXAMPLE 1

```
ConvertTo-UrlEncode -URL https://www.google.com/
```

Would return
https%3a%2f%2fwww.google.com%2f





### Example 2: EXAMPLE 2

```
ConvertTo-UrlEncode -URL https://www.google.com/ -IncludeInput
```

Would return
PlainText               Encoded
---------               -------
https://www.google.com/ https%3a%2f%2fwww.google.com%2f






## PARAMETERS

### -IncludeInput

A switch to determine if you want original text in the output.
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

### -URL

The original text that you want encoded.
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


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES



## RELATED LINKS

Fill Related Links Here

