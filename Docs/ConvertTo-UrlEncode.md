---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# ConvertTo-UrlEncode

## SYNOPSIS
To encode plaintext using \[Web.HttpUtility\]::UrlEncode()

## SYNTAX

```
ConvertTo-UrlEncode [[-URL] <String[]>] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
To encode plaintext using \[Web.HttpUtility\]::UrlEncode()

## EXAMPLES

### EXAMPLE 1
```
ConvertTo-UrlEncode -URL https://www.google.com/
```

Would return
https%3a%2f%2fwww.google.com%2f

### EXAMPLE 2
```
ConvertTo-UrlEncode -URL https://www.google.com/ -IncludeInput
```

Would return
PlainText               Encoded
---------               -------
https://www.google.com/ https%3a%2f%2fwww.google.com%2f

## PARAMETERS

### -URL
The original text that you want encoded.
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
A switch to determine if you want original text in the output.
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

## NOTES

## RELATED LINKS
