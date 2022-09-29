---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version: https://gallery.technet.microsoft.com/scriptcenter/Get-MachineType-VM-or-ff43f3a9
schema: 2.0.0
---

# Get-NTFSPermission

## SYNOPSIS
To get permission information on a specified Path or folder name

## SYNTAX

```
Get-NTFSPermission [[-Path] <String[]>] [<CommonParameters>]
```

## DESCRIPTION
To get permission information on a specified Path or folder name

## EXAMPLES

### EXAMPLE 1
```
Get-NTFSPermission -Path "C:\Temp"
```

Would return:

A listing of all of the permissions

## PARAMETERS

### -Path
The name of the path

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
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
