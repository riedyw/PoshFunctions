---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# ConvertTo-HtmlEncode

## SYNOPSIS

To encode plaintext using [Web.HttpUtility]::HtmlEncode()

## SYNTAX

### __AllParameterSets

```
ConvertTo-HtmlEncode [[-Text <String[]>]] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

To encode plaintext using [Web.HttpUtility]::HtmlEncode()


## EXAMPLES

### Example 1: EXAMPLE 1

```
Convertfrom-HtmlEncode -HTML '&lt;This is some text &amp; a goodbye&gt;' -IncludeInput
```

HtmlEncoded                               PlainText
-----------                               ---------
&lt;This is some text &amp; a goodbye&gt; <This is some text & a goodbye>






## PARAMETERS

### -IncludeInput

A switch to determine if you want original text in the output.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Text

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

Inspired by: https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/html-encoding


## RELATED LINKS

Fill Related Links Here

