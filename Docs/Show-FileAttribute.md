---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# Show-FileAttribute

## SYNOPSIS
Shows the available file attributes

## SYNTAX

```
Show-FileAttribute [-IncludeValue] [<CommonParameters>]
```

## DESCRIPTION
Shows the available file attributes

## EXAMPLES

### EXAMPLE 1
```
Show-FileAttribute
```

Would return
ReadOnly
Hidden
System
Directory
Archive
Device
Normal
Temporary
SparseFile
ReparsePoint
Compressed
Offline
NotContentIndexed
Encrypted
IntegrityStream
NoScrubData

### EXAMPLE 2
```
Show-FileAttribute
```

Would return
Name                 Dec Hex
----                 --- ---
ReadOnly               1 0x1
Hidden                 2 0x2
System                 4 0x4
Directory             16 0x10
Archive               32 0x20
Device                64 0x40
Normal               128 0x80
Temporary            256 0x100
SparseFile           512 0x200
ReparsePoint        1024 0x400
Compressed          2048 0x800
Offline             4096 0x1000
NotContentIndexed   8192 0x2000
Encrypted          16384 0x4000
IntegrityStream    32768 0x8000
NoScrubData       131072 0x20000

## PARAMETERS

### -IncludeValue
{{ Fill IncludeValue Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### [string[]]
## NOTES

## RELATED LINKS
