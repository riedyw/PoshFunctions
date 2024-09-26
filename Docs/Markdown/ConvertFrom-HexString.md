---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# ConvertFrom-HexString

## SYNOPSIS

Convert a hex string or array of hex string to text

## SYNTAX

### __AllParameterSets

```
ConvertFrom-HexString [-HexString] <String[]> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

Convert a hex string or array of hex string to text


## EXAMPLES

### Example 1: EXAMPLE 1

```
ConvertFrom-HexString -HexString '434241'
```

CBA





### Example 2: EXAMPLE 2

```
414243 | ConvertFrom-HexString
```

ABC





### Example 3: EXAMPLE 3

```
ConvertFrom-HexString -HexString '414243', '434241' -IncludeInput
```

HexString String
--------- ------
414243    ABC
434241    CBA






## PARAMETERS

### -HexString

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


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### string



## NOTES



## RELATED LINKS

Fill Related Links Here

