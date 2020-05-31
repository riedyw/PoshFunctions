---
external help file: MyFunctions-help.xml
Module Name: MyFunctions
online version:
schema: 2.0.0
---

# Convert-HexToARGB

## SYNOPSIS
Converts Hex to ARGB values

## SYNTAX

```
Convert-HexToARGB [-Hex_Val] <String> [<CommonParameters>]
```

## DESCRIPTION
Converts Hex to ARGB values.
Hex values are needed to apply ISE colors in script

## EXAMPLES

### EXAMPLE 1
```
$ARGB = Convert-HexToARGB $HexValue
```

Assigns converted hex value to ARGB variable

## PARAMETERS

### -Hex_Val
An 8 character Hex value

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Part of the ISEColorThemeCmdlets.ps1 Script by Jeff Pollock
http://Lifeinpowerhsell.blogspot.com
http://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e

## RELATED LINKS
