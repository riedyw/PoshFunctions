---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Remove-BomFromFile

## SYNOPSIS
To remove BOM (byte order marking) from a file.

## SYNTAX

```
Remove-BomFromFile [[-Path] <String>] [[-Destination] <String>] [<CommonParameters>]
```

## DESCRIPTION
To remove BOM (byte order marking) from a file.

## EXAMPLES

### EXAMPLE 1
```
Remove-BomFromFiles -Path .\UTF8-BOM.txt -Destination .\UTF.txt
```

Takes the contents of .\UTF8-BOM.txt, removes the byte order marking
and writes to .\UTF8.txt

## PARAMETERS

### -Path
The path to the source file.

```yaml
Type: String
Parameter Sets: (All)
Aliases: OldPath

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Destination
The path to the destination file.

```yaml
Type: String
Parameter Sets: (All)
Aliases: NewPath

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
