---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-Desktop.ini

## SYNOPSIS

Gets the current Desktop.ini file for a particular folder

## SYNTAX

### __AllParameterSets

```
Get-Desktop.ini [[-Path <String>]] [<CommonParameters>]
```

## DESCRIPTION

Gets the current Desktop.ini file for a particular folder from the hidden, system file Desktop.ini from the specified path


## EXAMPLES

### Example 1: EXAMPLE 1

```
Assuming the file Desktop.ini exists in the current folder and contains:
```

Get-Content -Path .\Desktop.ini
[ViewState]
Mode=
Vid=
FolderType=Generic

[.ShellClassInfo]
InfoTip=This is hover over text
IconResource=TemporaryFolder2.ico,0

Get-Desktop.ini

Path    FolderType InfoTip                 IconResource
----    ---------- -------                 ------------
C:\Temp Generic    This is hover over text TemporaryFolder2.ico,0






## PARAMETERS

### -Path

The path to the folder

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: $pwd
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES



## RELATED LINKS

Fill Related Links Here

