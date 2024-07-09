---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Remove-FileAttribute

## SYNOPSIS

Removes a file attribute from specified path (ReadOnly, Hidden, System, Archive)

## SYNTAX

### __AllParameterSets

```
Remove-FileAttribute [-Path] <String[]> [-FileAttribute] <String[]> [<CommonParameters>]
```

## DESCRIPTION

Removes a file attribute from specified path (ReadOnly, Hidden, System, Archive)


## EXAMPLES

### Example 1: EXAMPLE 1

```
(Get-Item -Path .\Control.ini).Attributes
```

Archive

Remove-FileAttribute -Path .\Control.ini -FileAttribute Archive

(Get-Item -Path .\Control.ini).Attributes

Normal






## PARAMETERS

### -FileAttribute

A string, or string array, that represents file attributes.
Valid entries are: (ReadOnly, Hidden, System, Archive)

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (All) False (None)
Position: 1
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Path

A string, or string array, of path to file(s)

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES



## RELATED LINKS

Fill Related Links Here

