---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version: https://github.com/iRon7/Join-Object
schema: 2.0.0
---

# New-ColorPicker

## SYNOPSIS
Present a dialog to the user and allow them to select or define a color.
User can choose how the color will be returned.

## SYNTAX

```
New-ColorPicker [[-R] <Int32>] [[-G] <Int32>] [[-B] <Int32>] [-AsHashTable] [<CommonParameters>]
```

## DESCRIPTION
Present a dialog to the user and allow them to select or define a color.
User can choose how the color will be returned.

## EXAMPLES

### EXAMPLE 1
```
New-ColorPicker -R 20 -G 45 -B 255
```

Will present the user with a color dialog pre-populated with 23, 45, 255

### EXAMPLE 2
```
New-ColorPicker -verbose
```

VERBOSE: Starting \[New-ColorPicker\]
VERBOSE: R \[0\] G \[0\] B \[0\]

VERBOSE: Ending \[New-ColorPicker\]
R   G   B
-   -   -
0 128 192

Assuming that they entered the color 0, 128, 192 and selected 'Rgb' as the output type.

## PARAMETERS

### -R
The Red color value.
Defaults to '0'.
Valid range 0-255.
Can be passed from the pipeline by property name.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: Red

Required: False
Position: 1
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -G
The Green color value.
Defaults to '0'.
Valid range 0-255.
Can be passed from the pipeline by property name.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: Green

Required: False
Position: 2
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -B
The Blue color value.
Defaults to '0'.
Valid range 0-255.
Can be passed from the pipeline by property name.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: Blue

Required: False
Position: 3
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -AsHashTable
Switch that will present the results of 'R,G,B' as a hashtable as opposed to a psobject

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
The user can select how the result will be returned to them:

* Hex       - where the color will be returned as 6 hexadecimal characters in the form: 'RRGGBB'

* RgbString - where the color will be returned as 3 integers separated by a comman 'R,G,B'

* Rgb       - where the color will returned as a psobject with 3 properties: R, G, B

If the user selects 'Cancel' from the dialog box no value is returned.

## RELATED LINKS
