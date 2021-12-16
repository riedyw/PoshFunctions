---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# ConvertTo-HtmlEncode

## SYNOPSIS
To encode plaintext using \[Web.HttpUtility\]::HtmlEncode()

## SYNTAX

```
ConvertTo-HtmlEncode [[-Text] <String[]>] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
To encode plaintext using \[Web.HttpUtility\]::HtmlEncode()

## EXAMPLES

### EXAMPLE 1
```
Convertfrom-HtmlEncode -HTML '&lt;This is some text &amp; a goodbye&gt;' -IncludeInput
```

HtmlEncoded                               PlainText
-----------                               ---------
&lt;This is some text &amp; a goodbye&gt; \<This is some text & a goodbye\>

## PARAMETERS

### -Text
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

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

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
Inspired by: https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/html-encoding

## RELATED LINKS
