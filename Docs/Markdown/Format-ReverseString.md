---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Format-ReverseString

## SYNOPSIS

To reverse a string, or an array of strings

## SYNTAX

### __AllParameterSets

```
Format-ReverseString [-String] <String[]> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

To reverse a string, or an array of strings.
Function aliased to 'Reverse'


## EXAMPLES

### Example 1: EXAMPLE 1

```
Format-ReverseString -String 'Hello'
```

olleH





### Example 2: EXAMPLE 2

```
Format-ReverseString -String 'Hello' -IncludeInput
```

Original Reverse
-------- -------
Hello    olleH





### Example 3: EXAMPLE 3

```
'758', '129' | Format-ReverseString -IncludeInput
```

Original Reverse
-------- -------
758      857
129      921






## PARAMETERS

### -IncludeInput

Switch to include the input along with the output.
Aliased to 'IncludeOriginal' for
backward compatibility

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: IncludeOriginal
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -String

The string you wish to be reversed.
Can be a string or an array of strings.
Can be passed from the pipeline

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


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### string



## NOTES



## RELATED LINKS

Fill Related Links Here

