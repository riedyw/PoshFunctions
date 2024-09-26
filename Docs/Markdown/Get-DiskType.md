---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-DiskType

## SYNOPSIS

A quick function to determine what type of local disk a computer has

## SYNTAX

### __AllParameterSets

```
Get-DiskType [[-ComputerName <String[]>]] [<CommonParameters>]
```

## DESCRIPTION

A quick function to determine what type of local disk a computer has


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-DiskType
```

Query the local machine's disk to determine its bus and media types





### Example 2: EXAMPLE 2

```
Get-DiskType -ComputerName server01
```

Example output
ComputerName DeviceId BusType MediaType
------------ -------- ------- ---------
SERVER01     0        SAS     HDD
SERVER01     1        SAS     HDD






## PARAMETERS

### -ComputerName

A string (or string array) of computers that you want checked.
Defaults to $env:COMPUTERNAME

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: CN,Server
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: $env:COMPUTERNAME
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### PSCustomObject



## NOTES

inspired by https://learn.microsoft.com/en-us/answers/questions/350272/detect-if-system-windows-drive-is-ssd-or-hdd.html


## RELATED LINKS

Fill Related Links Here

