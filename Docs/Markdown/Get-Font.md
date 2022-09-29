---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version: http://wonkysoftware.appspot.com
schema: 2.0.0
---

# Get-Font

## SYNOPSIS
Gets the fonts currently loaded on the system

## SYNTAX

```
Get-Font [[-Font] <String>] [<CommonParameters>]
```

## DESCRIPTION
Uses the type System.Windows.Media.Fonts static property SystemFontFamilies,
to retrieve all of the fonts loaded by the system. 
If the Fonts type is not found,
the PresentationCore assembly will be automatically loaded

## EXAMPLES

### EXAMPLE 1
```
# Get All Fonts
```

Get-Font

### EXAMPLE 2
```
# Get All Lucida Fonts
```

Get-Font *Lucida*

## PARAMETERS

### -Font
A wildcard to search for font names

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Slight code fix in Where-Object logic.
Previously it would return zero results

## RELATED LINKS
