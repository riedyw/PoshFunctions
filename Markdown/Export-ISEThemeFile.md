---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version: https://www.google.com
schema: 2.0.0
---

# Export-ISEThemeFile

## SYNOPSIS
Exports an ISE theme to an xml file

## SYNTAX

```
Export-ISEThemeFile [[-ISETheme] <String>] [-SaveToISE] [<CommonParameters>]
```

## DESCRIPTION
Exports an ISE theme to an xml file and saves in the registry
if SaveToISE is passed

## EXAMPLES

### EXAMPLE 1
```
Export-ISEThemeFile -ISETheme "Monokai"
```

Exports ISE theme to an xml file

### EXAMPLE 2
```
Export-ISEThemeFile -SaveToISE
```

Exports the current ISE theme and saves it in the ISE for future reference

## PARAMETERS

### -ISETheme
{{ Fill ISETheme Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -SaveToISE
After exporting, save the theme to the registry

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Part of the ISEColorThemeCmdlets.ps1 Script by Jeff Pollock
http://Lifeinpowerhsell.blogspot.com
http://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e

## RELATED LINKS
