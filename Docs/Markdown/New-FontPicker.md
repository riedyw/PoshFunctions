---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version: https://github.com/iRon7/Join-Object
schema: 2.0.0
---

# New-FontPicker

## SYNOPSIS
Present a dialog to the user and allow them to select a font and its characteristics

## SYNTAX

```
New-FontPicker [<CommonParameters>]
```

## DESCRIPTION
Present a dialog to the user and allow them to select a font and its characteristics

## EXAMPLES

### EXAMPLE 1
```
New-FontPicker
```

Will present the user with a font dialog and return the following if Arial 18 point italic was selected:

FontFamily       : \[FontFamily: Name=Arial\]
Bold             : False
GdiCharSet       : 0
GdiVerticalFont  : False
Italic           : True
Name             : Arial
OriginalFontName :
Strikeout        : False
Underline        : False
Style            : Italic
Size             : 18
SizeInPoints     : 18
Unit             : Point
Height           : 28
IsSystemFont     : False
SystemFontName   :

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
If the user selects 'Cancel' from the dialog box no value is returned.

## RELATED LINKS
