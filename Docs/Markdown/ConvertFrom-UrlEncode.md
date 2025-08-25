---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# ConvertFrom-UrlEncode

## SYNOPSIS
Converts a URL encoded string back into a normal string

## SYNTAX

```
ConvertFrom-UrlEncode [[-URL] <String[]>] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
Converts a URL encoded string back into a normal string

## EXAMPLES

### EXAMPLE 1
```
ConvertFrom-UrlEncode -URL 'https%3a%2f%2fwww.google.com%2f'
```

Would return
https://www.google.com/

### EXAMPLE 2
```
ConvertFrom-UrlEncode -URL 'https%3a%2f%2fbing.com' -IncludeInput
```

Would return
Encoded                Decoded
-------                -------
https%3a%2f%2fbing.com https://bing.com

### EXAMPLE 3
```
ConvertFrom-UrlEncode -URL 'https%3a%2f%2fbing.com', 'https%3a%2f%2fwww.google.com%2f' -IncludeInput
```

Would return
Encoded                         Decoded
-------                         -------
https%3a%2f%2fbing.com          https://bing.com
https%3a%2f%2fwww.google.com%2f https://www.google.com/

## PARAMETERS

### -URL
The encoded URL string.
Can be a string or an array of strings.
Accepts pipeline input.

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

### -IncludeInput
A switch to enable showing original text in the output.
Aliased to 'IncludeOriginal' for backward compatibility of scripts

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

### [string]
## NOTES

## RELATED LINKS
