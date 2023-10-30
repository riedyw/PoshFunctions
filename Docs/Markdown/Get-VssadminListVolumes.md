---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-VssadminListVolumes

## SYNOPSIS

Runs 'vssadmin.exe list volumes' and parses the output into objects

## SYNTAX

### __AllParameterSets

```
Get-VssadminListVolumes [<CommonParameters>]
```

## DESCRIPTION

Runs 'vssadmin.exe list volumes' and parses the output into objects


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-VssAdminListVolumes
```

VolumePath                                        VolumeName
----------                                        ----------
\\?\Volume{727a7233-cd8b-44bb-a2fc-dfa771957fe6}\ \\?\Volume{727a7233-cd8b-44bb-a2fc-dfa771957fe6}\
C:\                                               \\?\Volume{e02a6fff-32f6-4c83-a7ac-527a0f0b3377}\
\\?\Volume{cd99c472-eaed-4de9-a0e0-aa618450adaa}\ \\?\Volume{cd99c472-eaed-4de9-a0e0-aa618450adaa}\






## PARAMETERS


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES



## RELATED LINKS

Fill Related Links Here

