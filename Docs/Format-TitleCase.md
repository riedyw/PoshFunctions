---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Format-TitleCase

## SYNOPSIS
Get the last day of the month given the year as an integer, and the month as an integer

## SYNTAX

```
Format-TitleCase [-String] <String[]> [-ToLowerFirst] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
Get the last day of the month given the year as an integer, and the month as an integer

## EXAMPLES

### EXAMPLE 1
```
Format-TitleCase -String 'hello THERE'
```

Hello THERE

### EXAMPLE 2
```
Format-TitleCase -String 'hello THERE' -ToLowerFirst
```

Hello There

### EXAMPLE 3
```
Format-TitleCase -String 'hello THERE' -ToLowerFirst -IncludeInput
```

Original    ToLowerFirst TitleCase
--------    ------------ ---------
hello THERE True         Hello There

## PARAMETERS

### -String
String or string array that you want to be put into your cultures title case

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -ToLowerFirst
Switch to first put the string to lower case then put to title case

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

### -IncludeInput
Switch to include the input in the output

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

### string
## NOTES
Inspired by: https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/title-casing-strings-capital-letter-starts-each-word

## RELATED LINKS
