---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Remove-OldFiles

## SYNOPSIS
Keeps the newest set of files in a path that match a pattern and deletes the rest

## SYNTAX

```
Remove-OldFiles [-Path] <String> [-FileSpec] <String> [[-Count] <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Keeps the newest set of files in a path that match a pattern and deletes the rest

## EXAMPLES

### EXAMPLE 1
```
Remove-OldFiles -Path 'C:\Windows\System32\WinEvt\Logs' -FileSpec 'Archive-System-*.evtx' -Count 30
```

It will search 'C:\Windows\System32\WinEvt\Logs' for files matching the wildcard 'Archive-System-*.evtx', keep the most recent 30 and delete the rest

## PARAMETERS

### -Path
The path of where to search for the FileSpec.
Mandatory

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FileSpec
The file specification to search for.
Most likely will include wildcards so that more than 1 file will be found.
Mandatory

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Count
Integer representing the number of newest files that will be kept, and the remainder deleted.
Validate between 1-100, default being 7.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: 7
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
