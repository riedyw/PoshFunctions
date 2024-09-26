---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Format-TitleCase

## SYNOPSIS

Get the last day of the month given the year as an integer, and the month as an integer

## SYNTAX

### __AllParameterSets

```
Format-TitleCase [-String] <String[]> [-IncludeInput] [-ToLowerFirst] [<CommonParameters>]
```

## DESCRIPTION

Get the last day of the month given the year as an integer, and the month as an integer


## EXAMPLES

### Example 1: EXAMPLE 1

```
Format-TitleCase -String 'hello THERE'
```

Hello THERE





### Example 2: EXAMPLE 2

```
Format-TitleCase -String 'hello THERE' -ToLowerFirst
```

Hello There





### Example 3: EXAMPLE 3

```
Format-TitleCase -String 'hello THERE' -ToLowerFirst -IncludeInput
```

Original    ToLowerFirst TitleCase
--------    ------------ ---------
hello THERE True         Hello There






## PARAMETERS

### -IncludeInput

Switch to include the input in the output

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

### -String

String or string array that you want to be put into your cultures title case

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

### -ToLowerFirst

Switch to first put the string to lower case then put to title case

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


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### string



## NOTES

Inspired by: https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/title-casing-strings-capital-letter-starts-each-word


## RELATED LINKS

Fill Related Links Here

