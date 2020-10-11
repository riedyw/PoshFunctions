---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Get-ShareStat

## SYNOPSIS
To get statistics on a share

## SYNTAX

```
Get-ShareStat [-ShareName] <String[]> [[-TempDrive] <String>] [[-Capacity] <String>] [<CommonParameters>]
```

## DESCRIPTION
To get statistics on a share including Size, FreeSpace, and FreePct.
Command line
parameter allows for capacity statistics in Bytes, KB, MB, and GB

## EXAMPLES

### EXAMPLE 1
```
Get-ShareStat -ShareName \\mda-102192\testnuget -Capacity MB
```

ShareName                 SizeMB FreeSpaceMB FreePct
---------                 ------ ----------- -------
\\\\mda-102192\testnuget 242831.45     20098.5    8.28

### EXAMPLE 2
```
Get-ShareStat -ShareName \\mda-102192\testnuget
```

ShareName              SizeGB FreeSpaceGB FreePct
---------              ------ ----------- -------
\\\\mda-102192\testnuget 237.14       19.63    8.28

### EXAMPLE 3
```
Get-ShareStat -ShareName \\mda-102192\testnuget -Verbose
```

VERBOSE: Starting Get-ShareStat
VERBOSE: Using temporary drive letter \[B:\]
VERBOSE: Capacity will be expressed in \[GB\]
VERBOSE: Perform operation 'Query CimInstances' with following parameters, ''queryExpression' = SELECT * FROM Win32_LogicalDisk WHERE DeviceID = 'B:','queryDialect' = WQL,'namespaceName' = root\cimv2'.
VERBOSE: Operation 'Query CimInstances' complete.
VERBOSE: Processing \\\\mda-102192\testnuget
VERBOSE: Mapping drive \[B:\] to \[\\\\mda-102192\testnuget\]
VERBOSE: Perform operation 'Query CimInstances' with following parameters, ''queryExpression' = SELECT * FROM win32_logicaldisk WHERE DeviceID = 'B:','queryDialect' = WQL,'namespaceName' = root\cimv2'.

VERBOSE: Operation 'Query CimInstances' complete.
VERBOSE: Unmapping drive \[B:\]
VERBOSE: Ending Get-ShareStat

ShareName              SizeGB FreeSpaceGB FreePct
---------              ------ ----------- -------
\\\\mda-102192\testnuget 237.14       19.62    8.28

## PARAMETERS

### -ShareName
Add help message for user

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TempDrive
{{ Fill TempDrive Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: B:
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
Position: 3
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
