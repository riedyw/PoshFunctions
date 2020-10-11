---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# FileSizeAbove

## SYNOPSIS
To use as a filter against Get-ChildItem

## SYNTAX

```
FileSizeAbove [[-Size] <Object>]
```

## DESCRIPTION
To use as a filter against Get-ChildItem

## EXAMPLES

### EXAMPLE 1
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
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES
Could NOT make this an advanced function

## RELATED LINKS
