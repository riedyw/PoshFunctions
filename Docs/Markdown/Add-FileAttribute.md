---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Add-FileAttribute

## SYNOPSIS
Adds  a file attribute from specified path (ReadOnly, Hidden, System, Archive)

## SYNTAX

```
Add-FileAttribute [-Path] <String[]> [-FileAttribute] <String[]> [<CommonParameters>]
```

## DESCRIPTION
Adds a file attribute from specified path (ReadOnly, Hidden, System, Archive)

## EXAMPLES

### EXAMPLE 1
```
(Get-Item -Path .\Control.ini).Attributes
```

Normal

Add-FileAttribute -Path .\Control.ini -FileAttribute Archive, ReadOnly

(Get-Item -Path .\Control.ini).Attributes

ReadOnly, Archive

## PARAMETERS

### -Path
A string, or string array, of path to file(s)

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FileAttribute
A string, or string array, that represents file attributes.
Valid entries are: (ReadOnly, Hidden, System, Archive)

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
