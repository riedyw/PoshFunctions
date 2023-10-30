---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-FileSizeOnDisk

## SYNOPSIS

Powershell script to get file size and size on disk of all files in a directory.

## SYNTAX

### __AllParameterSets

```
Get-FileSizeOnDisk [[-Path <String[]>]] [-Full] [<CommonParameters>]
```

## DESCRIPTION

This PowerShell script gets file size and size on disk in bytes of all files in a directory.


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-FileSizeOnDisk c:\myfolder
```







### Example 2: EXAMPLE 2

```
Get-FileSizeOnDisk -Path *.psd1
```

Name               Length SizeOnDisk FullName
----               ------ ---------- --------
PoshFunctions.psd1  21190      12288 C:\Git\PoshFunctions\PoshFunctions.psd1





### Example 3: EXAMPLE 3

```
Get-FileSizeOnDisk -Path *.psd1 -Full | Select-Object Name, Length, SizeOnDisk, LastWriteTime
```

Name               Length SizeOnDisk LastWriteTime
----               ------ ---------- -------------
PoshFunctions.psd1  21190      12288 11/22/2022 1:35:42 PM






## PARAMETERS

### -Full

Switch to return all attributes of Get-Item on the file plus the attribute SizeOnDisk

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Path

Directory path of the files to check.
If this parameter is not specified the default value is current directory.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: .
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### System.Management.Automation.PSObject[]



## NOTES

Inspired by: https://www.opentechguides.com/how-to/article/powershell/133/size-on-disk-ps.html

Changes:
* CmdletBinding
* write-verbose
* more help
* added -Full switch to get full attributes of a file including SizeOnDisk
* added ability to accept input from the pipeline


## RELATED LINKS

[www.opentechguides.com] ()

