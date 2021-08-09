---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# FileSizeBelow

## SYNOPSIS
To use as a filter against Get-ChildItem

## SYNTAX

```
FileSizeBelow [[-Size] <Int32>]
```

## DESCRIPTION
To use as a filter against Get-ChildItem

## EXAMPLES

### EXAMPLE 1
```
Assume I have 1 small file in c:\temp, and many larger files.
```

dir c:\temp -File | FileSizeBelow -Size 1KB | Select-Object FullName, LastWriteTime, Length

FullName        LastWriteTime        Length
--------        -------------        ------
C:\temp\log.log 12/8/2019 9:55:07 PM    186

## PARAMETERS

### -Size
The maximum size a file can be

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES
Could NOT make this an advanced function

## RELATED LINKS
