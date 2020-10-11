---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Get-DriveStat

## SYNOPSIS
To get statistics on drives on a particular server or servers.

## SYNTAX

```
Get-DriveStat [[-ComputerName] <String[]>] [[-Capacity] <String>] [<CommonParameters>]
```

## DESCRIPTION
To get statistics on drives on a server including Size, FreeSpace, and FreePct.
Command line
parameter allows for capacity statistics in Bytes, KB, MB, and GB

## EXAMPLES

### EXAMPLE 1
```
Get-DriveStat
```

ComputerName DeviceID VolumeName SizeGB FreeSpaceGB FreePct
------------ -------- ---------- ------ ----------- -------
localhost    C:       Windows    237.14       19.56    8.25

### EXAMPLE 2
```
Get-DriveStat -Capacity MB
```

ComputerName DeviceID VolumeName    SizeMB FreeSpaceMB FreePct
------------ -------- ----------    ------ ----------- -------
localhost    C:       Windows    242831.45    20026.65    8.25

### EXAMPLE 3
```
Get-DriveStat -Verbose
```

VERBOSE: Starting Get-DriveStat
VERBOSE: Capacity will be expressed in \[GB\]
VERBOSE: Processing MDA-102192

ComputerName : localhost
DeviceID     : C:
VolumeName   : Windows
SizeGB       : 237.14
FreeSpaceGB  : 19.56
FreePct      : 8.25

VERBOSE: Ending Get-DriveStat

## PARAMETERS

### -ComputerName
{{ Fill ComputerName Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: Server, ServerName, PSComputerName, SystemName

Required: False
Position: 1
Default value: $env:COMPUTERNAME
Accept pipeline input: False
Accept wildcard characters: False
```

### -Capacity
{{ Fill Capacity Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: GB
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### psobject
## NOTES

## RELATED LINKS
