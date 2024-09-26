---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# ConvertTo-PFEscape

## SYNOPSIS

Will return an escaped string given the original string, a string containing special characters that need to be escaped and the escape character itself.

## SYNTAX

### __AllParameterSets

```
ConvertTo-PFEscape [[-String <String>]] [[-SpecialChar <String>]] [[-EscapeChar <Char>]] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

Will return an escaped string given the original string, a string containing special characters that need to be escaped and the escape character itself.


## EXAMPLES

### Example 1: EXAMPLE 1

```
ConvertTo-PFEscape -String 'new\pass"word,123' -SpecialChar '''";,\' -EscapeChar '\'
```

new\\pass\"word\,123





### Example 2: EXAMPLE 2

```
ConvertTo-PFEscape -String 'new\pass"word,123' -SpecialChar '''";,\' -EscapeChar '\' -IncludeInput
```

OriginalString    SpecialChar EscapeChar EscapedString
--------------    ----------- ---------- -------------
new\pass"word,123 '";,\                \ new\\pass\"word\,123






## PARAMETERS

### -EscapeChar

The single character that is the escape character

```yaml
Type: Char
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 2
Default value: \
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -IncludeInput

Optional switch that will display all given values and the escaped result

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

### -SpecialChar

A string containing all special characters that need to be escaped.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 1
Default value: '";,\
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -String

The original text that needs to be escaped.
Mandatory

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: new\pass"word,123
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES



## RELATED LINKS

Fill Related Links Here

