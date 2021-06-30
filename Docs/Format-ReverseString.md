---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Format-ReverseString

## SYNOPSIS
To reverse a string, or an array of strings

## SYNTAX

```
Format-ReverseString [-String] <String[]> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
To reverse a string, or an array of strings.
Function aliased to 'Reverse'

## EXAMPLES

### EXAMPLE 1
```
Format-ReverseString -String 'Hello'
```

olleH

### EXAMPLE 2
```
Format-ReverseString -String 'Hello' -IncludeInput
```

Original Reverse
-------- -------
Hello    olleH

### EXAMPLE 3
```
'758', '129' | Format-ReverseString -IncludeInput
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

### -IncludeInput
Switch to include the input along with the output.
Aliased to 'IncludeOriginal' for
backward compatibility

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

### string
## NOTES

## RELATED LINKS
