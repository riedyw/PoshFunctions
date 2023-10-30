---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Move-ToRecycleBin

## SYNOPSIS

Instead of outright deleting a file, why not move it to the Recycle Bin?

## SYNTAX

### __AllParameterSets

```
Move-ToRecycleBin [-Path] <String[]> [<CommonParameters>]
```

## DESCRIPTION

Instead of outright deleting a file, why not move it to the Recycle Bin?
Function aliased to 'Recycle'


## EXAMPLES

### Example 1: EXAMPLE 1

```
Move-ToRecycleBin -Path c:\temp\dummyfile.txt -Verbose
```

VERBOSE: Moving 'c:\temp\dummyfile.txt' to the Recycle Bin





### Example 2: EXAMPLE 2

```
Move-ToRecycleBin -Path c:\temp\dummyfile2.txt
```

Would move c:\temp\dummyfile2.txt to the Recycle Bin





### Example 3: EXAMPLE 3

```
Move-ToRecycleBin .\FileDoesNotExist
```

Move-ToRecycleBin : ERROR: Path [.\FileDoesNotExist] does not exist





### Example 4: EXAMPLE 4

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
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES



## RELATED LINKS

Fill Related Links Here

