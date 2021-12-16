---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version: https://github.com/iRon7/Join-Object
schema: 2.0.0
---

# Move-ToRecycleBin

## SYNOPSIS
Instead of outright deleting a file, why not move it to the Recycle Bin?

## SYNTAX

```
Move-ToRecycleBin [-Path] <String[]> [<CommonParameters>]
```

## DESCRIPTION
Instead of outright deleting a file, why not move it to the Recycle Bin?
Function aliased to 'Recycle'

## EXAMPLES

### EXAMPLE 1
```
Move-ToRecycleBin -Path c:\temp\dummyfile.txt -Verbose
```

VERBOSE: Moving 'c:\temp\dummyfile.txt' to the Recycle Bin

### EXAMPLE 2
```
Move-ToRecycleBin -Path c:\temp\dummyfile2.txt
```

Would move c:\temp\dummyfile2.txt to the Recycle Bin

### EXAMPLE 3
```
Move-ToRecycleBin .\FileDoesNotExist
```

Move-ToRecycleBin : ERROR: Path \[.\FileDoesNotExist\] does not exist

### EXAMPLE 4
```
Move-ToRecycleBin -Path 'File1.txt', 'File2.txt'
```

Would move both File1.txt and File2.txt to the Recycle Bin

## PARAMETERS

### -Path
A string or array of strings representing a file or a folder.
Wildcards are
acceptable and will be resolved to specific file or folder names.
Can accept
values from the pipeline.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
