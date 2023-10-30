---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Convert-HexToRGB

## SYNOPSIS

Converts Hex to RGB values

## SYNTAX

### __AllParameterSets

```
Convert-HexToRGB [-Hex] <String[]> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

Converts Hex to RGB values


## EXAMPLES

### Example 1: EXAMPLE 1

```
Convert-HexToRGB -Hex '#ffffff' -IncludeInput
```

Hex     Red Green Blue RgbString
---     --- ----- ---- ---------
#ffffff 255   255  255 255,255,255





### Example 2: EXAMPLE 2

```
Convert-HexToRGB -Hex '808080'
```

128,128,128





### Example 3: EXAMPLE 3

```
Convert-HexToRGB -Hex '808080', 'ffffff', '#abab10' -IncludeInput
```

Hex     Red Green Blue RgbString
---     --- ----- ---- ---------
808080  128   128  128 128,128,128
ffffff  255   255  255 255,255,255
#abab10 171   171   16 171,171,16






## PARAMETERS

### -Hex

An 6 character Hex value with optional # prefix

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


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES



## RELATED LINKS

Fill Related Links Here

