---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# New-ColorPicker

## SYNOPSIS

Present a dialog to the user and allow them to select or define a color. User can choose how the color will be returned.

## SYNTAX

### __AllParameterSets

```
New-ColorPicker [[-R <Int32>]] [[-G <Int32>]] [[-B <Int32>]] [-AsHashTable] [<CommonParameters>]
```

## DESCRIPTION

Present a dialog to the user and allow them to select or define a color.
User can choose how the color will be returned.


## EXAMPLES

### Example 1: EXAMPLE 1

```
New-ColorPicker -R 20 -G 45 -B 255
```

Will present the user with a color dialog pre-populated with 23, 45, 255





### Example 2: EXAMPLE 2

```
New-ColorPicker -verbose
```

VERBOSE: Starting [New-ColorPicker]
VERBOSE: R [0] G [0] B [0]

VERBOSE: Ending [New-ColorPicker]
R   G   B
-   -   -
0 128 192

Assuming that they entered the color 0, 128, 192 and selected 'Rgb' as the output type.






## PARAMETERS

### -AsHashTable

Switch that will present the results of 'R,G,B' as a hashtable as opposed to a psobject

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

### -B

The Blue color value.
Defaults to '0'.
Valid range 0-255.
Can be passed from the pipeline by property name.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: Blue
Accepted values: 

Required: True (None) False (All)
Position: 2
Default value: 0
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
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
Accepted values: 

Required: True (None) False (All)
Position: 1
Default value: 0
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -R

The Red color value.
Defaults to '0'.
Valid range 0-255.
Can be passed from the pipeline by property name.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: Red
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: 0
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES

The user can select how the result will be returned to them:

* Hex       - where the color will be returned as 6 hexadecimal characters in the form: 'RRGGBB'

* RgbString - where the color will be returned as 3 integers separated by a comman 'R,G,B'

* Rgb       - where the color will returned as a psobject with 3 properties: R, G, B

If the user selects 'Cancel' from the dialog box no value is returned.


## RELATED LINKS

Fill Related Links Here

