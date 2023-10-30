---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-FolderName

## SYNOPSIS

Gets a foldername through the native OpenFileDialog.

## SYNTAX

### __AllParameterSets

```
Get-FolderName [[-Path <String>]] [[-Title <String>]] [-NoNewFolder] [<CommonParameters>]
```

## DESCRIPTION

Gets a foldername through the native OpenFileDialog.
If user clicks 'OK' an [array] is returned, otherwise returns
a $null if the dialog is canceled.
Aliased function to 'Get-Folder' for backward compatibility


## EXAMPLES

### Example 1: EXAMPLE 1

```
$Folder = Get-FolderName
```

Will present a folderopen dialog box and save the selection to '$Folder'






## PARAMETERS

### -NoNewFolder

Switch which controls whether 'New folder' button appears in the dialog box.

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

String indicating the initial path selected in the dialog.
Aliased to 'InitialDirectory', 'RootFolder'

```yaml
Type: String
Parameter Sets: (All)
Aliases: InitialDirectory,RootFolder
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: $pwd
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Title

String indicating the Title of the dialog box.
Defaults to 'Select a folder'

```yaml
Type: String
Parameter Sets: (All)
Aliases: Description
Accepted values: 

Required: True (None) False (All)
Position: 1
Default value: Select a folder
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### System.String[]



## NOTES

Inspiration: Part of the ISEColorThemeCmdlets.ps1 Script by Jeff Pollock
            http://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e
# Source: https://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e
# get-help about_ISE-Color-Theme-Cmdlets for more information


## RELATED LINKS

Fill Related Links Here

