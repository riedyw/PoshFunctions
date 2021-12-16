---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version: http://wonkysoftware.appspot.com
schema: 2.0.0
---

# Get-FolderName

## SYNOPSIS
Gets a foldername through the native OpenFileDialog.

## SYNTAX

```
Get-FolderName [[-Path] <String>] [-NoNewFolder] [[-Title] <String>] [<CommonParameters>]
```

## DESCRIPTION
Gets a foldername through the native OpenFileDialog.
If user clicks 'OK' an \[array\] is returned, otherwise returns
a $null if the dialog is canceled.
Aliased function to 'Get-Folder' for backward compatibility

## EXAMPLES

### EXAMPLE 1
```
$Folder = Get-FolderName
```

Will present a folderopen dialog box and save the selection to '$Folder'

## PARAMETERS

### -Path
String indicating the initial path selected in the dialog.
Aliased to 'InitialDirectory', 'RootFolder'

```yaml
Type: String
Parameter Sets: (All)
Aliases: InitialDirectory, RootFolder

Required: False
Position: 1
Default value: $pwd
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoNewFolder
Switch which controls whether 'New folder' button appears in the dialog box.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Title
String indicating the Title of the dialog box.
Defaults to 'Select a folder'

```yaml
Type: String
Parameter Sets: (All)
Aliases: Description

Required: False
Position: 2
Default value: Select a folder
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.String[]
## NOTES
Inspiration: Part of the ISEColorThemeCmdlets.ps1 Script by Jeff Pollock
            http://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e
# Source: https://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e
# get-help about_ISE-Color-Theme-Cmdlets for more information

## RELATED LINKS
