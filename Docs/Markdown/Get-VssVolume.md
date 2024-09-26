---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-VssVolume

## SYNOPSIS

Runs 'vssadmin.exe list volumes' and parses the output into objects

## SYNTAX

### __AllParameterSets

```
Get-VssVolume [<CommonParameters>]
```

## DESCRIPTION

Runs 'vssadmin.exe list volumes' and parses the output into objects


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-VssVolume
```

VssVolume                                         VolumeName
---------                                         ----------
C:\                                               \\?\Volume{613fc8d3-61cc-4199-868b-530990bde935}\
\\?\Volume{ddc280b3-b5f1-4feb-a12a-512d0488fbd8}\ \\?\Volume{ddc280b3-b5f1-4feb-a12a-512d0488fbd8}\






## PARAMETERS


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES



## RELATED LINKS

Fill Related Links Here

