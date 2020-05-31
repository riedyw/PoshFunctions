---
external help file: MyFunctions-help.xml
Module Name: MyFunctions
online version: http://go.microsoft.com/fwlink/?LinkId=821483
schema: 2.0.0
---

# Import-ISEThemeFile

## SYNOPSIS
Imports an ISE theme XML file into the registry.

## SYNTAX

```
Import-ISEThemeFile [-FileName] <Object> [-ApplyTheme] [<CommonParameters>]
```

## DESCRIPTION
Imports an ISE theme xml file into the registry and applies it
to the current session if ApplyTheme is passed

## EXAMPLES

### EXAMPLE 1
```
Import-ISEThemeFile "C:\ISEthemes\.StorableColorTheme.ps1xml"
```

Imports ISE theme to the registry

### EXAMPLE 2
```
Get-FileName | Import-ISEThemeFile -ApplyTheme
```

Imports piped in ISE theme to the registry and applies the theme to the current session

## PARAMETERS

### -FileName
{{Fill FileName Description}}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -ApplyTheme
Switch for applying the theme after importing it.

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
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Part of the ISEColorThemeCmdlets.ps1 Script by Jeff Pollock
http://Lifeinpowerhsell.blogspot.com
http://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e

## RELATED LINKS
