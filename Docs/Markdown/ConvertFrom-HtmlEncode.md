---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# ConvertFrom-HtmlEncode

## SYNOPSIS
Converts a URL encoded string back into a normal string

## SYNTAX

```
ConvertFrom-HtmlEncode [[-HTML] <String[]>] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
Converts a HTML encoded string back into a normal string

## EXAMPLES

### EXAMPLE 1
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
Inspired by: https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/html-encoding

## RELATED LINKS
