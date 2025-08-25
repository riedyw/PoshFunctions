---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version: https://www.Google.com
schema: 2.0.0
---

# Get-VssVolume

## SYNOPSIS
Runs 'vssadmin.exe list volumes' and parses the output into objects

## SYNTAX

```
Get-VssVolume [<CommonParameters>]
```

## DESCRIPTION
Runs 'vssadmin.exe list volumes' and parses the output into objects

## EXAMPLES

### EXAMPLE 1
```
Get-VssVolume
```

VssVolume                                         VolumeName
---------                                         ----------
C:\                                               \\\\?\Volume{613fc8d3-61cc-4199-868b-530990bde935}\
\\\\?\Volume{ddc280b3-b5f1-4feb-a12a-512d0488fbd8}\ \\\\?\Volume{ddc280b3-b5f1-4feb-a12a-512d0488fbd8}\

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
