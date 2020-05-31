---
external help file: MyFunctions-help.xml
Module Name: MyFunctions
online version:
schema: 2.0.0
---

# Convert-ARGBToHex

## SYNOPSIS
Converts an ARGB color string to hex equivalent

## SYNTAX

```
Convert-ARGBToHex [-ARGB] <String> [-IncludeHash <Boolean>] [<CommonParameters>]
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
#FF804020

### EXAMPLE 2
```
Convert-ARGBToHex -ARGB '255,255,0,0' -inc:$false
```

Would return
FFFF0000

### EXAMPLE 3
```
convert-argbtohex '255,64,128,255'
```

Would return
#FF4080FF

### EXAMPLE 4
```
'255,128,128,92' | convert-argbtohex -inc:$false
```

Would return
FF80805C

## PARAMETERS

### -ARGB
An ARGB color string in the form '#,#,#,#' where each number is between 0 and 255.

```yaml
Type: String
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
Default value = $True.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: True
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### [string]

region Parameters

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

