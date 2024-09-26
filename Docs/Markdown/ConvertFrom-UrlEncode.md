---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# ConvertFrom-UrlEncode

## SYNOPSIS

Converts a URL encoded string back into a normal string

## SYNTAX

### __AllParameterSets

```
ConvertFrom-UrlEncode [[-URL <String[]>]] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

Converts a URL encoded string back into a normal string


## EXAMPLES

### Example 1: EXAMPLE 1

```
ConvertFrom-UrlEncode -URL 'https%3a%2f%2fwww.google.com%2f'
```

Would return
https://www.google.com/





### Example 2: EXAMPLE 2

```
ConvertFrom-UrlEncode -URL 'https%3a%2f%2fbing.com' -IncludeInput
```

Would return
Encoded                Decoded
-------                -------
https%3a%2f%2fbing.com https://bing.com





### Example 3: EXAMPLE 3

```
ConvertFrom-UrlEncode -URL 'https%3a%2f%2fbing.com', 'https%3a%2f%2fwww.google.com%2f' -IncludeInput
```

Would return
Encoded                         Decoded
-------                         -------
https%3a%2f%2fbing.com          https://bing.com
https%3a%2f%2fwww.google.com%2f https://www.google.com/






## PARAMETERS

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

### -URL

The encoded URL string.
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

## OUTPUTS

### [string]



## NOTES



## RELATED LINKS

Fill Related Links Here

