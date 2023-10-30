---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# ConvertFrom-Base64

## SYNOPSIS

Convert from a Base64 string to normal string

## SYNTAX

### __AllParameterSets

```
ConvertFrom-Base64 [-Base64] <String[]> [-EncodingType <String>] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

Convert from a Base64 string to normal string.
Function aliased to 'Base64Decode'.


## EXAMPLES

### Example 1: EXAMPLE 1

```
ConvertFrom-Base64 "SABlAGwAbABvAA=="
```

Would return
Hello





### Example 2: EXAMPLE 2

```
ConvertFrom-Base64 "SABlAGwAbABvAA==" -IncludeInput
```

Would return
Base64           String
------           ------
SABlAGwAbABvAA== Hello






## PARAMETERS

### -Base64

A base64 encoded string

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

### -EncodingType

{{ Fill EncodingType Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: Unicode
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -IncludeInput

Switch to enable including the input to appear in the output

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

### [string[]]



## NOTES



## RELATED LINKS

Fill Related Links Here

