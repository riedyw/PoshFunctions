---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# Convert-HexToRGB

## SYNOPSIS
Converts Hex to RGB values

## SYNTAX

```
Convert-HexToRGB [-Hex] <String[]> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
Converts Hex to RGB values

## EXAMPLES

### EXAMPLE 1
```
Convert-HexToRGB -Hex '#ffffff' -IncludeInput
```

Hex     Red Green Blue RgbString
---     --- ----- ---- ---------
#ffffff 255   255  255 255,255,255

### EXAMPLE 2
```
Convert-HexToRGB -Hex '808080'
```

128,128,128

### EXAMPLE 3
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

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
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

## NOTES

## RELATED LINKS
