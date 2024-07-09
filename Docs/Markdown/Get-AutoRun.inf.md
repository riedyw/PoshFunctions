---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-AutoRun.inf

## SYNOPSIS

Gets the content of an AutoRun.inf for a drive.

## SYNTAX

### __AllParameterSets

```
Get-AutoRun.inf [[-Path <String>]] [<CommonParameters>]
```

## DESCRIPTION

Gets the content of an AutoRun.inf for a drive.


## EXAMPLES

### Example 1: EXAMPLE 1

```
Assuming the D: drive has an AutoRun.inf file with the following contents
```

[AutoRun]
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
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: D:\
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES



## RELATED LINKS

Fill Related Links Here

