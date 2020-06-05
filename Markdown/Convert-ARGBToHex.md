---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Convert-ARGBToHex

## SYNOPSIS
Converts an ARGB color string to hex equivalent

## SYNTAX

```
Convert-ARGBToHex [-ARGB] <String[]> [-IncludeHash] [-IncludeOriginal] [<CommonParameters>]
```

## DESCRIPTION
Converts an ARGB color string to hex equivalent.
Input should be in the form 'A,R,G,B'

## EXAMPLES

### EXAMPLE 1
```
Convert-ARGBToHex -ARGB '255,128,64,32'
```

Would return
FF804020

### EXAMPLE 2
```
Convert-ARGBToHex -ARGB '255,255,0,0' -IncludeHash
```

Would return
#FFFF0000

### EXAMPLE 3
```
convert-argbtohex '255,64,128,255' -IncludeHash
```

Would return
#FF4080FF

### EXAMPLE 4
```
'255,128,128,92' | convert-argbtohex
```

Would return
FF80805C

### EXAMPLE 5
```
Convert-ARGBToHex -ARGB @('255,0,0','255,128,80,80') -IncludeHash -IncludeOriginal
```

Would return
DecimalARGB   HexARGB
-----------   -------
0,255,0,0     #00FF0000
255,128,80,80 #FF805050

## PARAMETERS

### -ARGB
An ARGB color string in the form '#,#,#,#' where each number is between 0 and 255.

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

### -IncludeHash
A switch indicating whether hex string should be preceded by a hash symbol #.

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

### -IncludeOriginal
A switch indicating whether to include the original decimal ARGB input in the output

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

### [string]
## NOTES
Part of the ISEColorThemeCmdlets.ps1 Script by Jeff Pollock
http://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e

Modified:     Bill Riedy
a) Changed name of parameter to ARGB
b) Added -IncludeHash parameter to make # optional.
c) Minor tweaking so that it passes Invoke-ScriptAnalyzer
d) Added parameter validation on ARGB.
e) Added .LINK entries for related items

## RELATED LINKS

[about_ISE-Color-Theme-Cmdlets]()

[Convert-HexToARGB]()

