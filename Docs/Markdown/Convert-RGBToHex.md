---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Convert-RGBToHex

## SYNOPSIS

Converts an RGB color string to hex equivalent

## SYNTAX

### String (Default)

```
Convert-RGBToHex [-RGB] <String[]> [-IncludeInput] [-Prefix] [<CommonParameters>]
```

### Colors

```
Convert-RGBToHex [-Blue <Int32>] [-Green <Int32>] [-IncludeInput] [-Prefix] [-Red <Int32>] [<CommonParameters>]
```

## DESCRIPTION

Converts an RGB color string to hex equivalent.
Input should be in the form 'A,R,G,B'


## EXAMPLES

### Example 1: EXAMPLE 1

```
Convert-RGBToHex -RGB '128,64,32'
```

Would return
804020





### Example 2: EXAMPLE 2

```
Convert-RGBToHex -RGB '255,0,0' -Prefix
```

Would return
#FF0000





### Example 3: EXAMPLE 3

```
convert-RGBtohex '64,128,255' -Prefix
```

Would return
#4080FF





### Example 4: EXAMPLE 4

```
'128,128,92' | convert-RGBtohex
```

Would return
80805C





### Example 5: EXAMPLE 5

```
Convert-RGBToHex -RGB @('255,0,0','128,80,80') -Prefix -IncludeInput
```

Would return
DecimalRGB  HexRGB
---------   -------
255,0,0     #00FF0000
128,80,80   #FF805050






## PARAMETERS

### -Blue

{{ Fill Blue Description }}

```yaml
Type: Int32
Parameter Sets: Colors
Aliases: B
Accepted values: 

Required: True (None) False (Colors)
Position: Named
Default value: 0
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -Green

{{ Fill Green Description }}

```yaml
Type: Int32
Parameter Sets: Colors
Aliases: G
Accepted values: 

Required: True (None) False (Colors)
Position: Named
Default value: 0
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -IncludeInput

A switch indicating whether to include the original decimal RGB input in the output, aliased to 'IncludeOriginal'

```yaml
Type: SwitchParameter
Parameter Sets: Colors, String
Aliases: 
Accepted values: 

Required: True (None) False (Colors, String)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Prefix

A switch indicating whether hex string should be preceded by a hash symbol #.

```yaml
Type: SwitchParameter
Parameter Sets: Colors, String
Aliases: 
Accepted values: 

Required: True (None) False (Colors, String)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Red

{{ Fill Red Description }}

```yaml
Type: Int32
Parameter Sets: Colors
Aliases: R
Accepted values: 

Required: True (None) False (Colors)
Position: Named
Default value: 0
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -RGB

An RGB color string in the form '#,#,#,#' where each number is between 0 and 255.

```yaml
Type: String[]
Parameter Sets: String
Aliases: 
Accepted values: 

Required: True (String) False (None)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### [string]



## NOTES

Inspired by ISEColorThemeCmdlets.ps1 Script by Jeff Pollock
http://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e

Modified:
a) Changed name of parameter to RGB
b) Added -Prefix parameter to make # optional.
c) Minor tweaking so that it passes Invoke-ScriptAnalyzer
d) Added parameter validation on RGB.
e) Added .LINK entries for related items


## RELATED LINKS

[about_ISE-Color-Theme-Cmdlets] ()

[Convert-HexToRGB] ()

