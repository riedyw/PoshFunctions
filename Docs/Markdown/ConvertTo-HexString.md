---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# ConvertTo-HexString

## SYNOPSIS

Convert a string or array of string to hex strings

## SYNTAX

### __AllParameterSets

```
ConvertTo-HexString [-String] <String[]> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

Convert a string or array of string to hex strings


## EXAMPLES

### Example 1: EXAMPLE 1

```
ConvertTo-HexString -String 'CBA'
```

434241





### Example 2: EXAMPLE 2

```
'ABC' | ConvertTo-HexString
```

414243





### Example 3: EXAMPLE 3

```
'ABC', 'abc' | ConvertTo-HexString  -IncludeInput
```

String HexString
------ ---------
ABC    414243
abc    616263






## PARAMETERS

### -IncludeInput

Switch indicating that you want the input to be included in the output

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

An array of hex strings that need to be converted back to text.
Values can be passed from the pipeline.

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

