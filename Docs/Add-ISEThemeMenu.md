---
external help file: MyFunctions-help.xml
Module Name: MyFunctions
online version:
schema: 2.0.0
---

# Add-ISEThemeMenu

## SYNOPSIS
Adds a theme to the ISE Theme menu

## SYNTAX

```
Add-ISEThemeMenu [[-MenuName] <String>] [[-ShortcutDirectory] <String>] [<CommonParameters>]
```

## DESCRIPTION
Adds a theme to the ISE Theme menu

## EXAMPLES

### EXAMPLE 1
```
Add-ISEThemeMenu
```

Blah

## PARAMETERS

### -MenuName
The name as you want it to appear in the theme menu

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ShortcutDirectory
Where you want it placed.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None are required, but you can use parameters to control behavior.

## OUTPUTS

### None.

## NOTES
Author:      Bill Riedy
Inspiration: Part of the ISEColorThemeCmdlets.ps1 Script by Jeff Pollock
             http://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e
Changes:     Added parameter for MultiSelect of files.
Forced function to always return an array.
Filter is
             now a parameter that can be specified to control behavior.
Changed InitialDirectory to default
             to $pwd and to give an alias of 'Path' which is commonly used parameter name.
             Also changed syntax to Add-Type -AssemblyName to conform with
             Powershell 2+ and to be more "Powershelly".

## RELATED LINKS
