---
external help file: MyFunctions-help.xml
Module Name: MyFunctions
online version:
schema: 2.0.0
---

# Set-ISETheme

## SYNOPSIS
Applies ISE theme to current session.

## SYNTAX

### FromFile
```
Set-ISETheme -File <String> [<CommonParameters>]
```

### FromReg
```
Set-ISETheme -ThemeName <String> [<CommonParameters>]
```

### FromObj
```
Set-ISETheme -ThemeObject <Object> [<CommonParameters>]
```

## DESCRIPTION
Applies ISE theme to current session.

## EXAMPLES

### EXAMPLE 1
```
Get-FileName | Set-ISETheme
```

Gets the ISE theme information from the supplied xml file and assigns it to Theme

## PARAMETERS

### -File
An ISE theme xml filename

```yaml
Type: String
Parameter Sets: FromFile
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -ThemeName
The name of an ISE theme stored in the registry

```yaml
Type: String
Parameter Sets: FromReg
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -ThemeObject
{{Fill ThemeObject Description}}

```yaml
Type: Object
Parameter Sets: FromObj
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
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
