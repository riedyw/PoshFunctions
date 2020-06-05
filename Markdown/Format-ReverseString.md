---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version: https://www.google.com
schema: 2.0.0
---

# Format-ReverseString

## SYNOPSIS
To reverse a string, or an array of strings

## SYNTAX

```
Format-ReverseString [-String] <String[]> [-IncludeOriginal] [<CommonParameters>]
```

## DESCRIPTION
To reverse a string, or an array of strings

## EXAMPLES

### EXAMPLE 1
```
Format-ReverseString -String 'Hello'
```

olleH

### EXAMPLE 2
```
Format-ReverseString -String 'Hello' -IncludeOriginal
```

Original Reverse
-------- -------
Hello    olleH

### EXAMPLE 3
```
'758', '129' | Format-ReverseString -IncludeOriginal
```

Original Reverse
-------- -------
758      857
129      921

## PARAMETERS

### -String
The string you wish to be reversed.
Can be a string or an array of strings.
Can be passed from the pipeline

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -IncludeOriginal
{{ Fill IncludeOriginal Description }}

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

## RELATED LINKS
