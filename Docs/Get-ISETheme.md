---
external help file: MyFunctions-help.xml
Module Name: MyFunctions
online version:
schema: 2.0.0
---

# Get-ISETheme

## SYNOPSIS
Gets an ISE theme

## SYNTAX

### fromfile
```
Get-ISETheme -File <String> [<CommonParameters>]
```

### fromreg
```
Get-ISETheme -ThemeName <String> [<CommonParameters>]
```

## DESCRIPTION
Gets an ISE them from either the registry or xml file

## EXAMPLES

### EXAMPLE 1
```
$Theme = Get-FileName | Get-ISETheme
```

Gets the ISE theme information from the supplied xml file and assigns it to Theme

## PARAMETERS

### -File
An ISE theme xml filename

```yaml
Type: String
Parameter Sets: fromfile
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
Parameter Sets: fromreg
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
