---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Get-FileName

## SYNOPSIS
Gets a filename through the native OpenFileDialog.
Can select a single file or multiple files.

## SYNTAX

```
Get-FileName [[-InitialDirectory] <String>] [-MultiSelect] [[-Filter] <String>] [[-Title] <String>]
 [-AddExtension] [[-DefaultExt] <String>] [<CommonParameters>]
```

## DESCRIPTION
Gets a filename through the native OpenFileDialog.
Can select a single file
or multiple files.
If user clicks 'OK' an \[array\] is returned, otherwise returns
a $null if the dialog is canceled.

## EXAMPLES

### EXAMPLE 1
```
$File = Get-FileName
```

Will present a fileopen dialog box where only a single file can be selected and the fileopen
dialog box will start in the current directory.
Assigns selected file to the 'File' variable.

### EXAMPLE 2
```
$File = Get-FileName -MultiSelect -Filter 'Powershell files|*.ps1|All files|*.*'
```

Will present a fileopen dialog box where multiple files can be selected and the fileopen
dialog box will start in the current directory.
There will be a drop down list box in lower right
where the user can select 'Powershell files' or 'All files' and the files listed will change.
Assigns selected file(s) to the 'File' variable.

### EXAMPLE 3
```
$File = Get-FileName -MultiSelect -InitialDirectory 'C:\Temp'
```

Will present a fileopen dialog box where multiple files can be selected and the fileopen
dialog box will start in the C:\Temp directory.
Assigns selected file(s) to the 'File' variable.

### EXAMPLE 4
```
Get-FileName | get-childitem
```

Pipes selected filename to the get-childitem cmdlet.

## PARAMETERS

### -InitialDirectory
The directory for the OpenFileDialog to start in.
Defaults to $pwd.
Aliased to 'Path'.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Path

Required: False
Position: 1
Default value: "$pwd"
Accept pipeline input: False
Accept wildcard characters: False
```

### -MultiSelect
Determines if you can select one or multiple files.
Defaults to $false.
Aliased to 'Multi'.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: Multi

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Filter
A character string delimited with pipe '|' character.
Each 'token' in the string follows the form
'Description|FileSpec'.
Multiple 'tokens' can be in the string and they too are separated
by the pipe character.
Defaults to 'All files|*.*'.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: All files (*.*)|*.*
Accept pipeline input: False
Accept wildcard characters: False
```

### -Title
default

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AddExtension
{{ Fill AddExtension Description }}

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

### -DefaultExt
{{ Fill DefaultExt Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None are required, but you can use parameters to control behavior.
## OUTPUTS

### [array]     If user selects file(s) and clicks 'OK'. Will return an array with a .Count
###             and each element in the array will be the file(s) selected
### $null       If the user clicks 'Cancel'.
## NOTES
Author:      Bill Riedy
Inspiration: Part of the ISEColorThemeCmdlets.ps1 Script by Jeff Pollock
            http://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e
Changes:     Added parameter for MultiSelect of files.
Forced function to always return an array.
Filter is
            now a parameter that can be specified to control behavior.
Changed InitialDirectory to default
            to $pwd and to give an alias of 'Path' which is commonly used parameter name.
            Also changed syntax to Add-Type -AssemblyName to conform with
            Powershell 2+ and to be more "Powershelly".

## RELATED LINKS
