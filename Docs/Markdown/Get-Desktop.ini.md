---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version: http://wonkysoftware.appspot.com
schema: 2.0.0
---

# Get-Desktop.ini

## SYNOPSIS
Gets the current Desktop.ini file for a particular folder

## SYNTAX

```
Get-Desktop.ini [[-Path] <String>] [<CommonParameters>]
```

## DESCRIPTION
Gets the current Desktop.ini file for a particular folder from the hidden, system file Desktop.ini from the specified path

## EXAMPLES

### EXAMPLE 1
```
Assuming the file Desktop.ini exists in the current folder and contains:
```

Get-Content -Path .\Desktop.ini
\[ViewState\]
Mode=
Vid=
FolderType=Generic

\[.ShellClassInfo\]
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

Required: False
Position: 1
Default value: $pwd
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
