---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Get-AutoRun.inf

## SYNOPSIS
Gets the content of an AutoRun.inf for a drive.

## SYNTAX

```
Get-AutoRun.inf [[-Path] <String>] [<CommonParameters>]
```

## DESCRIPTION
Gets the content of an AutoRun.inf for a drive.

## EXAMPLES

### EXAMPLE 1
```
Assuming the D: drive has an AutoRun.inf file with the following contents
```

\[AutoRun\]
Icon=TemporaryFolder.ico
Label=10 MB FAT VHD

Get-AutoRun.inf -Path d:

Path Label         Icon
---- -----         ----
D:\  10 MB FAT VHD TemporaryFolder.ico

## PARAMETERS

### -Path
The path to the drive.
Must begin with a drive letter followed by a colon ':'.
Defaults to $pwd

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: D:\
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
