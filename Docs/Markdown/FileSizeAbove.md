---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# FileSizeAbove

## SYNOPSIS

To use as a filter against Get-ChildItem

## SYNTAX

### __AllParameterSets

```
FileSizeAbove [[-Size <Int32>]] [<CommonParameters>]
```

## DESCRIPTION

To use as a filter against Get-ChildItem


## EXAMPLES

### Example 1: EXAMPLE 1

```
Assume I have 1 large file in c:\temp, and many smaller files.
```

dir c:\temp | FileSizeAbove -Size 1GB | Select-Object FullName, LastWriteTime, Length

FullName            LastWriteTime            Length
--------            -------------            ------
C:\temp\install.wim 3/5/2020 11:39:23 AM 4314799742






## PARAMETERS

### -Size

The minimum size a file can be

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

## NOTES

Could NOT make this an advanced function


## RELATED LINKS

Fill Related Links Here

