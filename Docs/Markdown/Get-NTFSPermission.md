---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-NTFSPermission

## SYNOPSIS

To get permission information on a specified Path or folder name

## SYNTAX

### __AllParameterSets

```
Get-NTFSPermission [[-Path <String[]>]] [<CommonParameters>]
```

## DESCRIPTION

To get permission information on a specified Path or folder name


## EXAMPLES

### Example 1: EXAMPLE 1

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
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES



## RELATED LINKS

Fill Related Links Here

